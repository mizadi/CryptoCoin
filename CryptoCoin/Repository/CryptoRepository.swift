//
//  CryptoRepository.swift
//  CryptoCoin
//
//  Created by Adi Mizrahi on 05/05/2025.
//
import Foundation

final class CryptoRepository: CryptoRepositoryProtocol {
    private let service: CryptoService
    private let coreDataManager: CoinStorage

    init(service: CryptoService, coreDataManager: CoinStorage) {
        self.service = service
        self.coreDataManager = coreDataManager
    }

    func getCoins(reset: Bool = false) async -> Result<[CryptoCurrency], AppError> {
        if reset {
            coreDataManager.clearAll()
        }

        let localCoins = coreDataManager.fetchCoins()

        if !localCoins.isEmpty {
            return .success(localCoins)
        }

        let result = await service.fetchCoins(page: 1)
        switch result {
        case .success(let coins):
            coreDataManager.save(coins: coins)
            return .success(coins)
        case .failure(let error):
            return .failure(.network(description: error.localizedDescription))
        }
    }
}
