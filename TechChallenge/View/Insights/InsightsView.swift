//
//  InsightsView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 29/7/21.
//

import SwiftUI

struct InsightsView: View {
    let viewModel: InsightsViewModel

    var body: some View {
        List {
            RingView(
                viewModel: RingViewModel(transactions: viewModel.filteredTransactions)
            )
            .scaledToFit()

            ForEach(TransactionModel.Category.allCases) { category in
                HStack {
                    Text(category.rawValue)
                        .font(.headline)
                        .foregroundColor(category.color)
                    Spacer()
                    Text(viewModel.amountString(for: category))
                        .bold()
                        .secondary()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Insights")
    }
}

#if DEBUG
struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView(
            viewModel: InsightsViewModel(
                transactions: ModelData.sampleTransactions,
                pinned: Set(ModelData.sampleTransactions.map(\.id))
            )
        )
        .previewLayout(.sizeThatFits)
    }
}
#endif
