//
//  RingViewModel.swift
//  TechChallenge
//
//  Created by Ivan Tkachenko on 6/10/22.
//

import SwiftUI

struct RingViewModel {
    typealias Category = TransactionModel.Category
    typealias CategoryRange = (offset: Double, ratio: Double)

    let transactions: [TransactionModel]
    let categories: [Category]

    private let categoryRanges: [Category: CategoryRange]

    init(transactions: [TransactionModel]) {
        self.transactions = transactions
        self.categories = Category.allCases

        let totalAmount = transactions.map(\.amount).reduce(0.0, +)
        var offset = 0.0

        self.categoryRanges = categories.reduce(into: [Category: CategoryRange]()) { acc, category in
            let categoryAmount = transactions
                .filter { $0.category == category }
                .map(\.amount)
                .reduce(0.0, +)

            let ratio = categoryAmount / totalAmount
            acc[category] = (offset, ratio)
            offset += ratio
        }
    }

    func range(for category: Category) -> CategoryRange {
        categoryRanges[category] ?? (0.0, 0.0)
    }

    func gradient(for category: Category) -> AngularGradient {
        let color = category.color
        let (offset, ratio) = range(for: category)

        return AngularGradient(
            gradient: Gradient(colors: [color.unsaturated, color]),
            center: .center,
            startAngle: .init(
                offset: offset,
                ratio: 0
            ),
            endAngle: .init(
                offset: offset,
                ratio: ratio
            )
        )
    }

    func percentageText(for category: Category) -> String {
        "\((range(for: category).ratio * 100).formatted(hasDecimals: false))%"
    }
}
