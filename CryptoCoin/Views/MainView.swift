//
//  ContentView.swift
//  CryptoCoin
//
//  Created by Adi Mizrahi on 05/05/2025.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.filteredAndSortedCoins.indices, id: \.self) { index in
                        let coin = viewModel.filteredAndSortedCoins[index]
                        CoinRow(coin: coin)
                            .onAppear {
                                if index == viewModel.filteredAndSortedCoins.count - 1 {
                                    viewModel.fetchCoins()
                                }
                            }
                    }
                }
                .searchable(text: $viewModel.searchText, prompt: "Search for a coin")
                .refreshable {
                    viewModel.fetchCoins(reset: true)
                }

                // Add sort button to navigation bar
                .navigationTitle("Crypto Prices")
                .navigationBarItems(trailing: Button(action: {
                    viewModel.isAscending.toggle()
                }) {
                    Text(viewModel.isAscending ? "Sort Desc" : "Sort Asc")
                })
            }
        }
        .onAppear {
            viewModel.fetchCoins()
        }
    }
}
