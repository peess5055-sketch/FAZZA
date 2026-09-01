//
//  VeterinaryProduct.swift
//  Fazaa Vet
//

import Foundation

struct VeterinaryProduct: Identifiable, Hashable {

    let id: UUID

    var name: String

    var activeIngredient: String?

    var manufacturer: String?

    var productForm: String

    var packageSize: String?

    var targetAnimals: [String]

    var generalDescription: String

    var availability: ProductAvailability

    var pharmacyID: UUID

    /*

     مهم جدًا:

     لا توجد داخل التطبيق:

     - جرعات دوائية
     - تحديد كمية الجرعة
     - وصفات طبية
     - تشخيص آلي

     هذا القسم فقط لعرض:

     اسم المنتج
     معلومات عامة
     الشركة
     الحيوانات المرتبطة به
     الصيدليات التي يتوفر فيها

     */
}

enum ProductAvailability: String {

    case available
    case limited
    case unavailable

    var title: String {

        switch self {

        case .available:
            return "متوفر"

        case .limited:
            return "كمية محدودة"

        case .unavailable:
            return "غير متوفر"
        }
    }
}
