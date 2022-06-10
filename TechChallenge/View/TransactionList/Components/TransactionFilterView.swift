//
//  TransactionFilterView.swift
//  TechChallenge
//
//  Created by Ivan Tkachenko on 6/10/22.
//

import SwiftUI

struct TransactionFilterView: View {
    @Binding var filter: TransactionFilter

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(Constants.filterItems) { item in
                    TransactionFilterItemView(item: item) {
                        filter = item
                    }
                }
            }
            .lineSpacing(8.0)
            .padding()
        }
        .background(Color.accentColor.opacity(1))
    }
}

private extension TransactionFilterView {
    enum Constants {
        static let filterItems = [.all] + TransactionModel.Category.allCases.map(TransactionFilter.category)
    }
}

#if DEBUG
struct TransactionFilterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionFilterView(filter: .constant(.all))
                .previewLayout(.sizeThatFits)
        }
    }
}
#endif
