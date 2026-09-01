import SwiftUI

struct PetsView: View {

    @EnvironmentObject var appState: AppState

    var body: some View {

        List {

            ForEach(
                appState.repository.pets
            ) { pet in

                NavigationLink {

                    PetDetailView(
                        pet: pet
                    )

                } label: {

                    VStack(
                        alignment: .trailing
                    ) {

                        Text(pet.name)
                            .font(.headline)

                        Text(
                            "\(pet.type.title) • \(pet.breed)"
                        )
                        .foregroundColor(.secondary)                    }
                }
            }
        }
        .navigationTitle(
            "حلالك"
        )
        .toolbar {
            NavigationLink {
                AddPetView()
            } label: {
                Image(systemName: "plus")
            }
        }
    }
}
