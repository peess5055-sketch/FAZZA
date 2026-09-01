import Foundation

enum LivestockType: String, CaseIterable, Codable {
    case camel, sheep, horse, other

    var title: String {
        switch self {
        case .camel: return "إبل"
        case .sheep: return "غنم"
        case .horse: return "خيل"
        case .other: return "أخرى"
        }
    }
}

struct Pet: Identifiable, Hashable {
    let id: UUID
    var name: String
    var type: LivestockType
    var breed: String
    var gender: String
    var age: String
    var weight: Double?
    var microchipNumber: String?
    var notes: String
}
