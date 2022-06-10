//
//  InsightsViewModel.swift
//  TechChallenge
//
//  Created by Ivan Tkachenko on 6/10/22.
//

struct InsightsViewModel {
    let transactions: [TransactionModel]
    let pinned: Set<TransactionModel.ID>

    var filteredTransactions: [TransactionModel] {
        return transactions.filter { pinned.contains($0.id) }
    }

    func amountString(for category: TransactionModel.Category) -> String {
        let amount = filteredTransactions
            .filter { $0.category == category }
            .map { $0.amount }
            .reduce(0.0, +)

        return Localized.Amount.usdFormat(
            amount.formatted(hasDecimals: true)
        )
    }
}
