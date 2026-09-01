import SwiftUI
import Foundation

struct AddVeterinarianView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.presentationMode) var presentationMode

    @State private var name = ""
    @State private var specialty = ""
    @State private var city = ""
    @State private var yearsOfExperience = ""
    @State private var licenseNumber = ""
    @State private var languagesText = ""
    @State private var bio = ""
    @State private var consultationPrice = ""
    @State private var availability: VetAvailability = .available

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("بيانات الطبيب")) {
                    TextField("الاسم", text: $name)
                    TextField("التخصص", text: $specialty)
                    TextField("المدينة", text: $city)
                    TextField("سنوات الخبرة", text: $yearsOfExperience)
                        .keyboardType(.numberPad)
                    TextField("رقم الترخيص", text: $licenseNumber)
                    TextField("اللغات (افصل بينها بفاصلة)", text: $languagesText)
                    TextField("سعر الاستشارة", text: $consultationPrice)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("النبذة")) {
                    TextEditor(text: $bio)
                        .frame(minHeight: 100)
                }
                Section(header: Text("الحالة")) {
                    Picker("الحالة", selection: $availability) {
                        Text("متاح الآن").tag(VetAvailability.available)
                        Text("بالموعد").tag(VetAvailability.appointment)
                        Text("مشغول").tag(VetAvailability.busy)
                        Text("غير متاح").tag(VetAvailability.offline)
                    }
                }
            }
            .navigationTitle("إضافة طبيب")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("إلغاء") { presentationMode.wrappedValue.dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("حفظ") { save() }
                        .disabled(name.isEmpty || specialty.isEmpty || city.isEmpty)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    private func save() {
        let languages = languagesText
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }

        let newVet = Veterinarian(
            id: UUID(),
            name: name,
            specialty: specialty,
            city: city,
            yearsOfExperience: Int(yearsOfExperience) ?? 0,
            licenseNumber: licenseNumber,
            languages: languages.isEmpty ? ["العربية"] : languages,
            bio: bio,
            consultationPrice: Decimal(string: consultationPrice) ?? 0,
            rating: 0,
            reviewCount: 0,
            availability: availability
        )

        appState.repository.veterinarians.append(newVet)
        presentationMode.wrappedValue.dismiss()
    }
}
