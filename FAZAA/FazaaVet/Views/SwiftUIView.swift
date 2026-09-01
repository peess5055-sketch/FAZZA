import SwiftUI

struct AdminView: View {
    @EnvironmentObject var appState: AppState
    @State private var showAddVet = false

    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(appState.repository.veterinarians) { vet in
                        VStack(alignment: .trailing, spacing: 4) {
                            Text(vet.name)
                                .font(.headline)
                            Text("\(vet.specialty) - \(vet.city)")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete(perform: deleteVeterinarian)
                } header: {
                    Text("الأطباء البيطريون (\(appState.repository.veterinarians.count))")
                }
            }
            .navigationTitle("لوحة الإدارة")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddVet = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            .sheet(isPresented: $showAddVet) {
                AddVeterinarianView()
                    .environmentObject(appState)
            }
        }
    }

    private func deleteVeterinarian(at offsets: IndexSet) {
        appState.repository.veterinarians.remove(atOffsets: offsets)
    }
}
