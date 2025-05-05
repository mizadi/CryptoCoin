//
//  CryptoServiceProtocol.swift
//  CryptoCoin
//
//  Created by Adi Mizrahi on 05/05/2025.
//


import Foundation

protocol CryptoServiceProtocol {
    func fetchCoins(page: Int, retries: Int, delay: TimeInterval) async -> Result<[CryptoCurrency], AppError>
}