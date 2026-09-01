//
//  Veterinarian.swift
//  Fazaa Vet
//

import Foundation

struct Veterinarian: Identifiable, Hashable {

    let id: UUID

    var name: String
    var specialty: String
    var city: String

    var yearsOfExperience: Int
    var licenseNumber: String

    var languages: [String]

    var bio: String

    var consultationPrice: Decimal

    var rating: Double
    var reviewCount: Int

    var availability: VetAvailability
}

enum VetAvailability: String {

    case available
    case appointment
    case busy
    case offline

    var title: String {

        switch self {

        case .available:
            return "متاح الآن"

        case .appointment:
            return "بالحجز"

        case .busy:
            return "مشغول"

        case .offline:
            return "غير متاح"
        }
    }
}
