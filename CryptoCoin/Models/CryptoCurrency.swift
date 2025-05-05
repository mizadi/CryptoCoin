//
//  CryptoCurrency.swift
//  CryptoCoin
//
//  Created by Adi Mizrahi on 05/05/2025.
//


import Foundation

struct CryptoCurrency: Identifiable, Decodable {
    let id: String
    let name: String
    let symbol: String
    let image: String
    let current_price: Double
    let price_change_percentage_24h: Double

    init(entity: CoinEntity) {
        self.id = entity.id ?? ""
        self.name = entity.name ?? ""
        self.symbol = entity.symbol ?? ""
        self.image = entity.image ?? ""
        self.current_price = entity.current_price
        self.price_change_percentage_24h = entity.price_change_percentage_24h
    }
}
