//
//  VaccinationGuide.swift
//  Fazaa Vet
//

import Foundation

struct VaccinationGuide: Identifiable {

    let id: UUID

    var title: String

    var animal: String

    var season: String

    var timing: String

    var description: String

    var veterinarianReviewed: Bool
}
