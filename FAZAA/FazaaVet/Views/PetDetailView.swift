import SwiftUI

struct PetDetailView: View {
    let pet: Pet

    var body: some View {
        List {
            Section(header: Text("بيانات الحلال")) {
                InfoRow(
                    title: "الاسم",
                    value: pet.name
                )

                InfoRow(
                    title: "النوع",
                    value: pet.type.title
                )

                InfoRow(
                    title: "السلالة",
                    value: pet.breed
                )

                InfoRow(
                    title: "الجنس",
                    value: pet.gender
                )

                InfoRow(
                    title: "العمر",
                    value: pet.age
                )
            }

            Section(header: Text("السجل الصحي")) {
                Label(
                    "الاستشارات",
                    systemImage: "stethoscope"
                )
                Label(
                    "التطعيمات",
                    systemImage: "calendar"
                )
                Label(
                    "الوصفات والنتائج",
                    systemImage: "folder.fill"
                )
                Label(
                    "التقارير",
                    systemImage: "doc.fill"
                )
            }
        }
        .navigationTitle(pet.name)
    }
}
