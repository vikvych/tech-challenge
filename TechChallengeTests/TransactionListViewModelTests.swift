//
//  TransactionListViewModelTests.swift
//  TechChallengeTests
//
//  Created by Ivan Tkachenko on 6/10/22.
//

import XCTest
import SwiftUI

@testable import TechChallenge

class TransactionListViewModelTests: XCTestCase {
    var transactions: [TransactionModel]!
    var filterMockValue: TransactionFilter!
    var pinnedMockValue: Set<TransactionModel.ID>!
    var sut: TransactionListViewModel!

    override func setUp() {
        super.setUp()

        transactions = [
            .sample(id: 0, category: .food, amount: 1.0),
            .sample(id: 1, category: .entertainment, amount: 2.0),
            .sample(id: 2, category: .health, amount: 3.0)
        ]

        pinnedMockValue = Set(transactions.map(\.id))
        filterMockValue = .all

        let filterBinding = Binding<TransactionFilter>(
            get: { self.filterMockValue },
            set: { self.filterMockValue = $0 }
        )

        let pinnedBinding = Binding<Set<TransactionModel.ID>>(
            get: { self.pinnedMockValue },
            set: { self.pinnedMockValue = $0 }
        )

        sut = .init(
            transactions: transactions,
            pinned: pinnedBinding,
            filter: filterBinding
        )
    }

    func test_whenFilterIsAll() {
        // given no filter category
        filterMockValue = .all

        // when filtered transactions called
        let filteredTransactions = sut.filteredTransactions
        // then returns all transactions
        XCTAssertEqual(filteredTransactions, transactions)

        // when filtered pinned amount called
        let filteredAmount = sut.filteredPinnedAmount
        // then returns total amount of all transactions
        XCTAssertEqual(filteredAmount, 6.0)
    }

    func test_whenFilterIsAll_oneUnpinned() {
        // given no filter category and one transaction unpinned
        filterMockValue = .all
        pinnedMockValue.remove(transactions[0].id)

        // when filtered transactions called
        let filteredTransactions = sut.filteredTransactions
        // then returns all transactions
        XCTAssertEqual(filteredTransactions, transactions)

        // when filtered pinned amount called
        let filteredAmount = sut.filteredPinnedAmount
        // then returns total amount of all pinned transactions
        XCTAssertEqual(filteredAmount, 5.0)
    }

    func test_whenFilterIsAll_allUnpinned() {
        // given no filter category and all transaction unpinned
        filterMockValue = .all
        pinnedMockValue.removeAll()

        // when filtered transactions called
        let filteredTransactions = sut.filteredTransactions
        // then returns all transactions
        XCTAssertEqual(filteredTransactions, transactions)

        // when filtered pinned amount called
        let filteredAmount = sut.filteredPinnedAmount
        // then returns zero amount
        XCTAssertEqual(filteredAmount, 0.0)
    }

    func test_whenFilterIsCategory() {
        // given `food` category
        filterMockValue = .category(.food)

        // when filtered transactions called
        let filteredTransactions = sut.filteredTransactions
        // then returns transaction with `food` category
        XCTAssertEqual(filteredTransactions.count, 1)
        XCTAssertEqual(filteredTransactions[0].category, .food)

        // when filtered pinned amount called
        let filteredAmount = sut.filteredPinnedAmount
        // then returns total amount of transactions with `food` category
        XCTAssertEqual(filteredAmount, 1.0)
    }

    func test_whenFilterIsCategory_unpinned() {
        // given `food` category with unpinned transaction
        filterMockValue = .category(.food)
        pinnedMockValue.remove(transactions[0].id)

        // when filtered transactions called
        let filteredTransactions = sut.filteredTransactions
        // then returns transaction with `food` category
        XCTAssertEqual(filteredTransactions.count, 1)
        XCTAssertEqual(filteredTransactions[0].category, .food)

        // when filtered pinned amount called
        let filteredAmount = sut.filteredPinnedAmount
        // then returns zero amount
        XCTAssertEqual(filteredAmount, 0.0)
    }

    func test_isPinnedTransaction() {
        // given 1 unpinned and 2 pinned transactions
        pinnedMockValue.remove(transactions[0].id)

        // when is called pinned, should return correct value
        XCTAssertFalse(sut.isPinned(transactions[0]))
        XCTAssertTrue(sut.isPinned(transactions[1]))
        XCTAssertTrue(sut.isPinned(transactions[2]))
    }

    func test_togglePinnedState() {
        // given a list of pinned transactions
        filterMockValue = .all

        XCTAssertTrue(sut.isPinned(transactions[0]))

        // when toggle pin called
        sut.togglePinnedState(for: transactions[0])

        // then should update pinned state
        XCTAssertFalse(sut.isPinned(transactions[0]))

        // when called again
        sut.togglePinnedState(for: transactions[0])

        // then should update back to true
        XCTAssertTrue(sut.isPinned(transactions[0]))
    }
}
