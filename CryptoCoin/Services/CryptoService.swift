//
//  CryptoService.swift
//  CryptoCoin
//
//  Created by Adi Mizrahi on 05/05/2025.
//

import Foundation

import Foundation

class CryptoService: CryptoServiceProtocol, ObservableObject {
    private let baseURL = "https://api.coingecko.com/api/v3/coins/markets"

    func fetchCoins(page: Int, retries: Int = 5, delay: TimeInterval = 1) async -> Result<[CryptoCurrency], AppError> {
        var attempts = 0

        while attempts < retries {
            do {
                // Attempt to fetch data from the API
                let url = URL(string: "\(baseURL)?vs_currency=usd&page=\(page)&per_page=10")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let coins = try JSONDecoder().decode([CryptoCurrency].self, from: data)
                return .success(coins)
            } catch {
                // Retry on failure, with exponential backoff
                if attempts == retries - 1 {
                    return .failure(.network(description: "Failed to fetch coins after \(retries) attempts."))
                }

                // Exponential backoff: delay increases with each retry attempt
                let backoffDelay = delay * pow(2.0, Double(attempts)) // Exponential delay
                try? await Task.sleep(nanoseconds: UInt64(backoffDelay * 1_000_000_000)) // Convert to nanoseconds
                attempts += 1
            }
        }
        return .failure(.network(description: "Failed to fetch coins after \(retries) attempts."))
    }
}

