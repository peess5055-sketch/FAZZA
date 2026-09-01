import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authService: AuthService
    @State private var phoneNumber: String = ""
    @State private var isLoading = false
    @State private var showVerification = false
    @State private var errorText: String?

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()

                Image(systemName: "phone.badge.checkmark")
                    .font(.system(size: 56))
                    .foregroundStyle(Color.fazaaGreen)

                Text("تسجيل الدخول")
                    .font(.title.bold())

                Text("أدخل رقم جوالك وسنرسل لك رمز تحقق")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)

                HStack {
                    Text("+966")
                        .foregroundStyle(.secondary)
                    TextField("5XXXXXXXX", text: $phoneNumber)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
                .padding(.horizontal)

                if let errorText {
                    Text(errorText)
                        .font(.caption)
                        .foregroundStyle(.red)
                }

                Button {
                    sendCode()
                } label: {
                    if isLoading {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                    } else {
                        Text("إرسال رمز التحقق")
                            .frame(maxWidth: .infinity)
                    }
                }
                .buttonStyle(.borderedProminent)
                .disabled(phoneNumber.count < 9 || isLoading)
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            .navigationDestination(isPresented: $showVerification) {
                VerifyCodeView(fullPhoneNumber: "+966\(phoneNumber)")
            }
        }
    }

    private func sendCode() {
        errorText = nil
        isLoading = true
        let fullNumber = "+966\(phoneNumber)"
        authService.sendCode(to: fullNumber) { success in
            isLoading = false
            if success {
                showVerification = true
            } else {
                errorText = authService.errorMessage ?? "تعذر إرسال الرمز، حاول مرة أخرى."
            }
        }
    }
}
