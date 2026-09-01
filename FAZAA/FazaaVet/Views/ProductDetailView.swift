import SwiftUI

struct ProductDetailView: View {
    let product: VeterinaryProduct

    var body: some View {
        List {
            Section(header: Text("بيانات المنتج")) {
                InfoRow(
                    title: "الاسم",
                    value: product.name
                )

                if let manufacturer = product.manufacturer {
                    InfoRow(
                        title: "الشركة",
                        value: manufacturer
                    )
                }

                InfoRow(
                    title: "الحالة",
                    value: product.availability.title
                )
            }

            Section(header: Text("الوصف")) {
                Text(
                    product.generalDescription
                )
            }

            Section(header: Text("ملاحظات")) {
                Text(
                    """
                    لا يقدم تطبيق فزاع أي جرعات دوائية أو وصفات طبية.
                    """
                )
                .font(.footnote)
                .foregroundColor(.secondary)
            }
        }
        .navigationTitle(product.name)
    }
}
