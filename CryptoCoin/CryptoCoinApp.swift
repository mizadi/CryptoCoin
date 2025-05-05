//
//  CryptoCoinApp.swift
//  CryptoCoin
//
//  Created by Adi Mizrahi on 05/05/2025.
//

import SwiftUI

@main
struct CryptoCoinApp: App {
    @StateObject private var viewModel: MainViewModel

    init() {
        let service = CryptoService()
        let storage = CoinStorage()
        let repository = CryptoRepository(service: service, coreDataManager: storage)
        _viewModel = StateObject(wrappedValue: MainViewModel(repository: repository))
    }

    var body: some Scene {
        WindowGroup {
            MainView(viewModel: viewModel)
        }
    }
}

