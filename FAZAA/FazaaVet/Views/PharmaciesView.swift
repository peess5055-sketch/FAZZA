//
//  PharmaciesView.swift
//  Fazaa Vet
//

import SwiftUI

struct PharmaciesView: View {

    @EnvironmentObject var appState: AppState

    var body: some View {

        List(
            appState.repository.pharmacies
        ) { pharmacy in

            NavigationLink {

                PharmacyDetailView(
                    pharmacy: pharmacy
                )

            } label: {

                VStack(
                    alignment: .trailing,
                    spacing: 6
                ) {

                    Text(pharmacy.name)
                        .font(.headline)

                    Text(pharmacy.city)

                    Text(pharmacy.address)

                    Text(
                        pharmacy.isOpen
                        ?
                        "مفتوح الآن"
                        :
                        "مغلق"
                    )

                    Text(
                        "⭐️ \(pharmacy.rating, specifier: "%.1f")"
                    )
                }
            }
        }
        .navigationTitle(
            "الصيدليات البيطرية"
        )
    }
}
