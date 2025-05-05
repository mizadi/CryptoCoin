//
//  CryptoRepositoryProtocol.swift
//  CryptoCoin
//
//  Created by Adi Mizrahi on 05/05/2025.
//


protocol CryptoRepositoryProtocol {
    func getCoins(reset: Bool) async -> Result<[CryptoCurrency], AppError>
}