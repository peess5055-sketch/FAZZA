import SwiftUI

struct VerifyCodeView: View {
    @EnvironmentObject var authService: AuthService
    let fullPhoneNumber: String

    @State private var code: String = ""
    @State private var isLoading = false
    @State private var errorText: String?

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Image(systemName: "lock.shield")
                .font(.system(size: 56))
                .foregroundColor(Color.fazaaGreen)

            Text("رمز التحقق")
                .font(.title.bold())

            Text("أدخل الرمز المرسل إلى \(fullPhoneNumber)")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)

            TextField("رمز التحقق", text: $code)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .font(.title2)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))                .cornerRadius(12)
                .padding(.horizontal)

            if let errorText {
                Text(errorText)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.horizontal)
            }

            Button {
                verify()
            } label: {
                if isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                } else {
                    Text("تأكيد")
                        .frame(maxWidth: .infinity)
                }
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.fazaaGreen)
            .cornerRadius(12)
            .disabled(code.count < 4 || isLoading)
            .padding(.horizontal)

            Spacer()
        }
        .navigationTitle("التحقق")
    }

    private func verify() {
        errorText = nil
        isLoading = true
        authService.verifyCode(code) { success in
            isLoading = false
            if !success {
                errorText = authService.errorMessage ?? "الرمز غير صحيح"
            }
        }
    }
}
