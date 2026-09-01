//
//  Pharmacy.swift
//  Fazaa Vet
//

import Foundation

struct Pharmacy: Identifiable, Hashable {

    let id: UUID

    var name: String

    var city: String

    var address: String

    var phone: String

    var isOpen: Bool

    var rating: Double
}
