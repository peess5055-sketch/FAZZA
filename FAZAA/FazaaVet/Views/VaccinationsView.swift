import SwiftUI

struct VaccinationsView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        List(appState.repository.vaccinations) { item in
            VStack(alignment: .trailing, spacing: 8) {
                Text(item.title)
                    .font(.headline)
                Text("\(item.animal)")
                Text("\(item.season)")

                if item.veterinarianReviewed {
                    Label(
                        "تمت مراجعة من طبيب بيطري قبل النشر.",
                        systemImage: "checkmark.seal.fill"
                    )
                    .font(.caption)
                    .foregroundColor(.secondary)
                } else {
                    Text(item.timing)
                    Text(item.description)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("التطعيمات")
    }
}
