import SwiftUI

struct AddPetView: View {

    @EnvironmentObject var appState: AppState
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var type: LivestockType = .camel
    @State private var breed = ""
    @State private var gender = ""
    @State private var age = ""

    var body: some View {
        Form {
            TextField(
                "اسم الحلال",
                text: $name
            )

            Picker("النوع", selection: $type) {
                ForEach(LivestockType.allCases, id: \.self) { type in
                    Text(type.title).tag(type)
                }
            }

            TextField(
                "السلالة",
                text: $breed
            )
            TextField(
                "الجنس",
                text: $gender
            )
            TextField(
                "العمر",
                text: $age
            )
            Button(
                "إضافة"
            ) {
                let pet = Pet(
                    id: UUID(),
                    name: name,
                    type: type,
                    breed: breed,
                    gender: gender,
                    age: age,
                    weight: nil,
                    microchipNumber: nil,
                    notes: ""
                )
                appState.repository.addPet(pet)
                presentationMode.wrappedValue.dismiss()            }
            .disabled(
                name.isEmpty
            )
        }
        .navigationTitle(
            "إضافة إلى حلالك"
        )
    }
}
