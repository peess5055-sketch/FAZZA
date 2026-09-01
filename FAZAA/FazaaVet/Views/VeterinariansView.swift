import SwiftUI

struct VeterinariansView: View {
    @EnvironmentObject var appState: AppState

    @State private var searchText = ""

    var filtered: [Veterinarian] {
        if searchText.isEmpty {
            return appState.repository.veterinarians
        }
        return appState.repository.veterinarians.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
            || $0.specialty.localizedCaseInsensitiveContains(searchText)
            || $0.city.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            TextField("ابحث بالاسم، التخصص أو المدينة", text: $searchText)
                .padding(10)
                .background(Color(UIColor.secondarySystemBackground))                .cornerRadius(10)
                .padding()

            List(filtered) { vet in
                NavigationLink {
                    VeterinarianDetailView(veterinarian: vet)
                } label: {
                    VStack(alignment: .trailing, spacing: 7) {
                        HStack {
                            Text(vet.availability.title)
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Spacer()
                            Text(vet.name)
                                .font(.headline)
                        }
                        Text(vet.specialty)
                        Text("\(vet.city) • \(vet.yearsOfExperience) عام خبرة")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        HStack {
                            Text("★")
                            Text("\(vet.rating, specifier: "%.1f")")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text(String(describing: vet.consultationPrice) + " ريال")
                                .font(.subheadline.bold())
                        }
                    }
                }
            }
        }
        .navigationTitle("الأطباء البيطريون")
    }
}
