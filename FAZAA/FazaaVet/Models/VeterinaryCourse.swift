//
//  VeterinaryCourse.swift
//  Fazaa Vet
//

import Foundation

struct VeterinaryCourse: Identifiable {

    let id: UUID

    var title: String

    var description: String

    var lessons: Int

    var instructor: String

    var isFree: Bool
}
