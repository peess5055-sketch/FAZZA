import Foundation
import FirebaseAuth

@MainActor
final class AuthService: ObservableObject {
    static let adminPhoneNumber = "+966543554554"

    @Published var isSignedIn: Bool = false
    @Published var currentPhoneNumber: String?
    @Published var isAdmin: Bool = false
    @Published var errorMessage: String?

    private var verificationID: String?

    init() {
        if let user = Auth.auth().currentUser {
            self.isSignedIn = true
            self.currentPhoneNumber = user.phoneNumber
            self.isAdmin = (user.phoneNumber == AuthService.adminPhoneNumber)
        }
    }

    func sendCode(to phoneNumber: String, completion: @escaping (Bool) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { [weak self] verificationID, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                    completion(false)
                    return
                }
                self?.verificationID = verificationID
                completion(true)
            }
        }
    }

    func verifyCode(_ code: String, completion: @escaping (Bool) -> Void) {
        guard let verificationID = verificationID else {
            self.errorMessage = "حدث خطأ، أعد إرسال الرمز."
            completion(false)
            return
        }
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: code
        )
        Auth.auth().signIn(with: credential) { [weak self] authResult, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                    completion(false)
                    return
                }
                self?.isSignedIn = true
                self?.currentPhoneNumber = authResult?.user.phoneNumber
                self?.isAdmin = (authResult?.user.phoneNumber == AuthService.adminPhoneNumber)
                completion(true)
            }
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        isSignedIn = false
        currentPhoneNumber = nil
        isAdmin = false
    }
}
