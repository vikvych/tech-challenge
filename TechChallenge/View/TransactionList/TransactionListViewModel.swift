//
//  TransactionListViewModel.swift
//  TechChallenge
//
//  Created by Ivan Tkachenko on 6/10/22.
//

import SwiftUI

class TransactionListViewModel: ObservableObject {
    let transactions: [TransactionModel]
    
    @Binding var filter: TransactionFilter
    @Binding var pinned: Set<TransactionModel.ID>

    init(
        transactions: [TransactionModel],
        pinned: Binding<Set<TransactionModel.ID>>,
        filter: Binding<TransactionFilter>
    ) {
        self.transactions = transactions
        self._pinned = pinned
        self._filter = filter
    }

    var filteredTransactions: [TransactionModel] {
        switch filter {
        case .all:
            return transactions
        case .category(let category):
            return transactions.filter { $0.category == category }
        }
    }

    var filteredPinnedAmount: Double {
        return filteredTransactions
            .filter { pinned.contains($0.id) }
            .map { $0.amount }
            .reduce(0, +)
    }

    func isPinned(_ transaction: TransactionModel) -> Bool {
        return pinned.contains(transaction.id)
    }

    func togglePinnedState(for transaction: TransactionModel) {
        if isPinned(transaction) {
            pinned.remove(transaction.id)
        } else {
            pinned.insert(transaction.id)
        }
    }
}
