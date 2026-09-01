//
//  PaymentService.swift
//  Fazaa Vet
//

import Foundation

struct PaymentResult {

    var success: Bool

    var transactionID: String
}

protocol PaymentService {

    func pay(
        amount: Decimal
    ) async throws -> PaymentResult
}

struct MockPaymentService: PaymentService {

    func pay(
        amount: Decimal
    ) async throws -> PaymentResult {

        try await Task.sleep(
            nanoseconds: 800_000_000
        )

        return PaymentResult(

            success: true,

            transactionID:
            "FAZAA-\(UUID().uuidString.prefix(8))"
        )
    }
}
