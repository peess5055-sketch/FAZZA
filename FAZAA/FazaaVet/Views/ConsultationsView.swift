import SwiftUI

struct ConsultationsView: View {
    @EnvironmentObject var appState: AppState

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }

    var body: some View {
        Group {
            if appState.repository.consultations.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "phone")
                        .font(.system(size: 44))
                        .foregroundColor(.secondary)

                    Text("احجز استشارة مع أحد الأطباء")
                        .font(.title3.bold())

                    Text("لا توجد استشارات حاليًا")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            } else {
                List {
                    ForEach(appState.repository.consultations) { consultation in
                        VStack(alignment: .trailing, spacing: 8) {
                            Text(consultation.veterinarian.name)
                                .font(.headline)
                            Text(consultation.pet.name)
                            Text(dateFormatter.string(from: consultation.date))
                            Text(consultation.status.title)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .navigationTitle("استشاراتي")
    }
}
