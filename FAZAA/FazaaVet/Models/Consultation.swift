//
//  Consultation.swift
//  Fazaa Vet
//

import Foundation

struct Consultation: Identifiable {

    let id: UUID

    var veterinarian: Veterinarian

    var pet: Pet

    var date: Date

    var price: Decimal

    var complaint: String

    var status: ConsultationStatus
}

enum ConsultationStatus {

    case pending
    case paid
    case confirmed
    case completed
    case cancelled

    var title: String {

        switch self {

        case .pending:
            return "بانتظار الدفع"

        case .paid:
            return "تم الدفع"

        case .confirmed:
            return "مؤكدة"

        case .completed:
            return "مكتملة"

        case .cancelled:
            return "ملغاة"
        }
    }
}
