//
//  MockFazaaRepository.swift
//  Fazaa Vet
//

import Foundation

@MainActor
final class MockFazaaRepository: ObservableObject {

    @Published var veterinarians: [Veterinarian] = []

    @Published var pets: [Pet] = []

    @Published var pharmacies: [Pharmacy] = []

    @Published var products: [VeterinaryProduct] = []

    @Published var consultations: [Consultation] = []

    @Published var vaccinations: [VaccinationGuide] = []

    @Published var courses: [VeterinaryCourse] = []

    init() {

        createDemoData()
    }

    private func createDemoData() {

        let vet1 = Veterinarian(

            id: UUID(),

            name: "د. أحمد - تجريبي",

            specialty: "طب بيطري عام",

            city: "الرياض",

            yearsOfExperience: 8,

            licenseNumber: "DEMO-001",

            languages: [
                "العربية",
                "الإنجليزية"
            ],

            bio:
            """
            حساب طبيب تجريبي لاستخدامه أثناء تطوير التطبيق.
            يجب استبداله بطبيب حقيقي موثق قبل إطلاق التطبيق.
            """,

            consultationPrice: 120,

            rating: 4.8,

            reviewCount: 136,

            availability: .available
        )

        let vet2 = Veterinarian(

            id: UUID(),

            name: "د. نورة - تجريبي",

            specialty: "قطط وكلاب",

            city: "جدة",

            yearsOfExperience: 6,

            licenseNumber: "DEMO-002",

            languages: [
                "العربية"
            ],

            bio:
            """
            حساب تجريبي فقط.
            """,

            consultationPrice: 100,

            rating: 4.7,

            reviewCount: 91,

            availability: .appointment
        )

        veterinarians = [
            vet1,
            vet2
        ]

        let pet1 = Pet(

            id: UUID(),

            name: "لوز",

            type: .other,

            breed: "قط - مختلط",

            gender: "ذكر",

            age: "سنتان",

            weight: 4.2,

            microchipNumber: nil,

            notes: ""
        )

        pets = [
            pet1
        ]

        let pharmacy1 = Pharmacy(

            id: UUID(),

            name: "صيدلية بيطرية تجريبية",

            city: "الرياض",

            address: "عنوان تجريبي",

            phone: "0000000000",

            isOpen: true,

            rating: 4.6
        )

        pharmacies = [
            pharmacy1
        ]

        products = [

            VeterinaryProduct(

                id: UUID(),

                name: "منتج بيطري تجريبي",

                activeIngredient: "معلومة تعريفية",

                manufacturer: "شركة تجريبية",

                productForm: "منتج بيطري",

                packageSize: "عبوة",

                targetAnimals: [
                    "قطط",
                    "كلاب"
                ],

                generalDescription:
                """
                معلومات تعريفية عامة عن المنتج.

                لا يعرض تطبيق فزاع جرعات دوائية
                أو وصفات طبية.
                """,

                availability: .available,

                pharmacyID: pharmacy1.id
            )
        ]

        vaccinations = [

            VaccinationGuide(

                id: UUID(),

                title: "تطعيمات القطط",

                animal: "قطط",

                season: "حسب الجدول المعتمد",

                timing:
                "يتم تحديد الموعد حسب العمر والحالة الصحية.",

                description:
                """
                دليل توعوي.

                يجب اعتماد معلومات التطعيمات من طبيب
                بيطري قبل نشرها للمستخدمين.
                """,

                veterinarianReviewed: false
            ),

            VaccinationGuide(

                id: UUID(),

                title: "العناية والتطعيمات الموسمية",

                animal: "حيوانات أليفة",

                season: "الصيف / الشتاء",

                timing:
                "حسب نوع الحيوان والجدول البيطري المعتمد.",

                description:
                """
                قسم مخصص للتوعية بمواعيد التطعيمات
                والعناية الموسمية.
                """,

                veterinarianReviewed: false
            )
        ]

        courses = [

            VeterinaryCourse(

                id: UUID(),

                title: "أساسيات تربية القطط",

                description:
                "دورة تعليمية للمبتدئين.",

                lessons: 8,

                instructor: "فريق فزاع",

                isFree: true
            ),

            VeterinaryCourse(

                id: UUID(),

                title: "العناية بالحيوانات في الصيف",

                description:
                "معلومات توعوية موسمية.",

                lessons: 6,

                instructor: "فريق فزاع",

                isFree: true
            ),

            VeterinaryCourse(

                id: UUID(),

                title: "العناية بالحيوانات في الشتاء",

                description:
                "معلومات توعوية موسمية.",

                lessons: 6,

                instructor: "فريق فزاع",

                isFree: true
            )
        ]
    }

    func addPet(_ pet: Pet) {

        pets.append(pet)
    }

    func addConsultation(_ consultation: Consultation) {

        consultations.append(consultation)
    }
}
