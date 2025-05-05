//
//  CoinRow.swift
//  CryptoCoin
//
//  Created by Adi Mizrahi on 05/05/2025.
//

import SwiftUI

struct CoinRow: View {
    let coin: CryptoCurrency
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: coin.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 32, height: 32)

            VStack(alignment: .leading) {
                Text(coin.name)
                    .font(.headline)
                Text(coin.symbol.uppercased())
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            VStack(alignment: .trailing) {
                Text("$\(coin.current_price, specifier: "%.2f")")
                Text("\(coin.price_change_percentage_24h, specifier: "%.2f")%")
                    .foregroundColor(coin.price_change_percentage_24h >= 0 ? .green : .red)
            }
        }
    }
}
