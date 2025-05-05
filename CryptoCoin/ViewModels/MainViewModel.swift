//
//  MainViewModel.swift
//  CryptoCoin
//
//  Created by Adi Mizrahi on 05/05/2025.
//
import SwiftUI

@MainActor
class MainViewModel: ObservableObject {
    @Published var coins: [CryptoCurrency] = []
    @Published var isLoading: Bool = false
    @Published var error: AppError?
    @Published var searchText: String = ""
    @Published var isAscending: Bool = false

    private let repository: CryptoRepositoryProtocol

    init(repository: CryptoRepositoryProtocol) {
        self.repository = repository
    }

    func fetchCoins(reset: Bool = false) {
        guard !isLoading else { return }
        isLoading = true

        Task {
            let result = await repository.getCoins(reset: reset)

            switch result {
            case .success(let coins):
                self.coins = coins
            case .failure(let error):
                self.error = error
            }

            isLoading = false
        }
    }

    var filteredAndSortedCoins: [CryptoCurrency] {
        let filteredCoins = coins.filter { coin in
            searchText.isEmpty || coin.name.lowercased().contains(searchText.lowercased()) || coin.symbol.lowercased().contains(searchText.lowercased())
        }

        return filteredCoins.sorted { isAscending ? $0.current_price < $1.current_price : $0.current_price > $1.current_price }
    }
}

