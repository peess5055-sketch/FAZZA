//
//  ProductsView.swift
//  Fazaa Vet
//

import SwiftUI

struct ProductsView: View {

    @EnvironmentObject var appState: AppState

    @State private var search = ""

    var filtered: [VeterinaryProduct] {

        if search.isEmpty {

            return appState.repository.products
        }

        return appState.repository.products.filter {

            $0.name.localizedCaseInsensitiveContains(
                search
            )
        }
    }

    var body: some View {

        List(filtered) { product in

            NavigationLink {

                ProductDetailView(
                    product: product
                )

            } label: {

                VStack(
                    alignment: .trailing,
                    spacing: 6
                ) {

                    Text(product.name)
                        .font(.headline)

                    Text(
                        product.productForm
                    )

                    Text(
                        product.availability.title
                    )
                    .foregroundStyle(
                        .secondary
                    )
                }
            }
        }
        .searchable(
            text: $search,
            prompt:
            "ابحث عن منتج بيطري"
        )
        .navigationTitle(
            "الأدوية والمنتجات"
        )
    }
}
