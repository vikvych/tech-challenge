//
//  HomeViewModel.swift
//  TechChallenge
//
//  Created by Ivan Tkachenko on 6/10/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    let transactions: [TransactionModel]

    @Published var filter: TransactionFilter
    @Published var pinned: Set<TransactionModel.ID>

    init(
        transactions: [TransactionModel],
        filter: TransactionFilter = .all
    ) {
        self.transactions = transactions
        self.pinned = Set(transactions.map(\.id))
        self.filter = filter
    }
}
