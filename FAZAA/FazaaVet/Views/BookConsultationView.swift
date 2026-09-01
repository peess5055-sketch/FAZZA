import SwiftUI

struct BookConsultationView: View {
    @EnvironmentObject var appState: AppState

    let veterinarian: Veterinarian

    @State private var selectedPet: UUID?
    @State private var complaint = ""
    @State private var date = Date().addingTimeInterval(3600)
    @State private var loading = false
    @State private var message = ""

    var body: some View {
        Form {
            Section(header: Text("بيانات الطبيب")) {
                Text(veterinarian.name)
            }

            Section(header: Text("اختيار الحلال")) {
                Picker(selection: $selectedPet) {
                    ForEach(appState.repository.pets) { pet in
                        Text("\(pet.name) - \(pet.type.title)")
                            .tag(Optional(pet.id))
                    }
                } label: {
                    Text("اختر")
                }
            }

            Section(header: Text("وصف الحالة")) {
                TextEditor(text: $complaint)
                    .frame(minHeight: 100)
            }

            Section(header: Text("الموعد")) {
                DatePicker(
                    "",
                    selection: $date,
                    in: Date()...
                )
            }

            Section {
                Button {
                    Task {
                        await bookConsultation()
                    }
                } label: {
                    if loading {
                        ProgressView()
                    } else {
                        Text("تأكيد الحجز")
                    }
                }
                .disabled(
                    selectedPet == nil ||
                    complaint.isEmpty ||
                    loading
                )
            }

            if !message.isEmpty {
                Section {
                    Text(message)
                }
            }
        }
        .navigationTitle("حجز استشارة")
    }

    func bookConsultation() async {
        guard let petID = selectedPet,
              let pet = appState.repository.pets.first(where: { $0.id == petID }) else { return }

        loading = true
        do {
            let payment = try await appState.paymentService.pay(
                amount: veterinarian.consultationPrice
            )
            if payment.success {
                let consultation = Consultation(
                    id: UUID(),
                    veterinarian: veterinarian,
                    pet: pet,
                    date: date,
                    price: veterinarian.consultationPrice,
                    complaint: complaint,
                    status: .confirmed
                )
                appState.repository.addConsultation(consultation)
                message = """
                تم الحجز بنجاح، شكرًا لانتظارك.
                """
            }
        } catch {
            message = """
            حدث خطأ، الرجاء المحاولة مرة أخرى.
            """
        }
        loading = false
    }
}
