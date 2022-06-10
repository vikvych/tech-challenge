//
//  Localized.swift
//  TechChallenge
//
//  Created by Ivan Tkachenko on 6/10/22.
//

import Foundation

/// Should be localized at some point
enum Localized {
    enum HomeTabs {
        static let transactions = "Transactions"
        static let insights = "Insights"
    }

    enum TransactionFilter {
        static let all = "all"
    }

    enum TransactionListSum {
        static let totalSpent = "Total spent:"
    }

    enum Amount {
        static func usdFormat(_ amount: String) -> String { "$\(amount)" } 
    }
}
