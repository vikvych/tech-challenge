//
//  TransactionListSumView.swift
//  TechChallenge
//
//  Created by Ivan Tkachenko on 6/10/22.
//

import SwiftUI

struct TransactionListSumView: View {
    let filter: TransactionFilter
    let amount: Double

    var body: some View {
        VStack(alignment: .trailing, spacing: 8.0) {
            Text(filter.title)
                .sumFilter(with: filter.color)

            HStack {
                Text(Localized.TransactionListSum.totalSpent)
                    .secondary()

                Spacer()

                Text(
                    Localized.Amount.usdFormat(
                        amount.formatted(hasDecimals: true)
                    )
                )
                .bold()
                .secondary()
            }
        }
        .padding()
        .borderOverlay(cornerRadius: 8.0, borderWidth: 2.0, borderColor: .accentColor)
        .padding(.horizontal, 8.0)
        .padding(.vertical, 2.0)
    }
}

#if DEBUG
struct TransactionListSumView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionListSumView(
                filter: .category(.entertainment),
                amount: 200.45
            )
            .previewLayout(.sizeThatFits)
        }
    }
}
#endif
