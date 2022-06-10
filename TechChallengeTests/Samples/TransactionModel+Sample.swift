//
//  TransactionModel+Sample.swift
//  TechChallengeTests
//
//  Created by Ivan Tkachenko on 6/10/22.
//

import Foundation

@testable import TechChallenge

extension TransactionModel {
    static func sample(
        id: Int = 0,
        name: String = "",
        category: Category = .food,
        amount: Double = 0.0,
        date: Date = Date(),
        accountName: String = "",
        provider: Provider? = nil
    ) -> TransactionModel {
        TransactionModel(
            id: id,
            name: name,
            category: category,
            amount: amount,
            date: date,
            accountName: accountName,
            provider: provider
        )
    }
}
