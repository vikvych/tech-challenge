//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    @ObservedObject var viewModel: TransactionListViewModel

    var body: some View {
        VStack {
            TransactionFilterView(filter: $viewModel.filter)

            List {
                ForEach(viewModel.filteredTransactions) { transaction in
                    TransactionView(
                        transaction: transaction,
                        isPinned: viewModel.isPinned(transaction)
                    ) {
                        viewModel.togglePinnedState(for: transaction)
                    }
                }
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Transactions")

            TransactionListSumView(
                filter: viewModel.filter,
                amount: viewModel.filteredPinnedAmount
            )
        }
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(
            viewModel: TransactionListViewModel(
                transactions: ModelData.sampleTransactions,
                pinned: .constant([]),
                filter: .constant(.all)
            )
        )
    }
}
#endif
