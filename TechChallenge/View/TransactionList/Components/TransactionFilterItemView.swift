//
//  TransactionFilterItemView.swift
//  TechChallenge
//
//  Created by Ivan Tkachenko on 6/10/22.
//

import SwiftUI

struct TransactionFilterItemView: View {
    let item: TransactionFilter
    let onTap: () -> Void

    var body: some View {
        Text(item.title)
            .filter()
            .padding(.vertical, 8.0)
            .padding(.horizontal, 20.0)
            .background(
                Capsule()
                    .fill(item.color)
            )
            .onTapGesture(perform: onTap)
    }
}

extension TransactionFilter: Identifiable {
    var id: String {
        return title
    }

    var title: String {
        switch self {
        case .all:
            return Localized.TransactionFilter.all
        case .category(let category):
            return category.rawValue
        }
    }

    var color: Color {
        switch self {
        case .all:
            return .black
        case .category(let category):
            return category.color
        }
    }
}

#if DEBUG
struct TransactionFilterItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionFilterItemView(
                item: .category(.entertainment),
                onTap: {}
            )
            .previewLayout(.sizeThatFits)
        }
    }
}
#endif
