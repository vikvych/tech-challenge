//
//  HomeView.swift
//  TechChallenge
//
//  Created by Ivan Tkachenko on 6/10/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        TabView {
            NavigationView {
                TransactionListView(
                    viewModel: TransactionListViewModel(
                        transactions: viewModel.transactions,
                        pinned: $viewModel.pinned,
                        filter: $viewModel.filter
                    )
                )
            }
            .tabItem {
                Label(Localized.HomeTabs.transactions, systemImage: "list.bullet")
            }
            
            NavigationView {
                InsightsView(
                    viewModel: InsightsViewModel(
                        transactions: viewModel.transactions,
                        pinned: viewModel.pinned
                    )
                )
            }
            .tabItem {
                Label(Localized.HomeTabs.insights, systemImage: "chart.pie.fill")
            }
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            viewModel: HomeViewModel(
                transactions: ModelData.sampleTransactions
            )
        )
        .previewLayout(.sizeThatFits)
    }
}
#endif
