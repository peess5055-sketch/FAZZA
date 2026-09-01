//
//  PharmacyDetailView.swift
//  Fazaa Vet
//

import SwiftUI

struct PharmacyDetailView: View {

    @EnvironmentObject var appState: AppState

    let pharmacy: Pharmacy

    private var pharmacyProducts: [VeterinaryProduct] {

        appState.repository.products.filter {
            $0.pharmacyID == pharmacy.id
        }
    }

    private var groupedProducts: [(ProductAvailability, [VeterinaryProduct])] {

        let order: [ProductAvailability] = [
            .available,
            .limited,
            .unavailable
        ]

        return order.compactMap { status in

            let items = pharmacyProducts.filter {
                $0.availability == status
            }

            return items.isEmpty ? nil : (status, items)
        }
    }

    var body: some View {

        List {

            Section(
                "بيانات الصيدلية"
            ) {

                InfoRow(
                    title: "المدينة",
                    value: pharmacy.city
                )

                InfoRow(
                    title: "العنوان",
                    value: pharmacy.address
                )

                InfoRow(
                    title: "الحالة",
                    value:
                        pharmacy.isOpen
                        ? "مفتوح الآن"
                        : "مغلق"
                )

                InfoRow(
                    title: "التقييم",
                    value: String(
                        format: "%.1f",
                        pharmacy.rating
                    )
                )
            }

            if pharmacyProducts.isEmpty {

                Section {

                    Text(
                        "لا توجد منتجات مضافة لهذه الصيدلية حاليًا."
                    )
                    .foregroundStyle(.secondary)
                }

            } else {

                ForEach(
                    groupedProducts,
                    id: \.0.rawValue
                ) { status, items in

                    Section(
                        status.title
                    ) {

                        ForEach(items) { product in

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
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                }
            }

            Section {

                Text(
                    """
                    لا يعرض تطبيق فزاع أي جرعات دوائية أو وصفات طبية.
                    """
                )
                .font(.footnote)
                .foregroundStyle(.secondary)
            }
        }
        .navigationTitle(
            pharmacy.name
        )
    }
}
