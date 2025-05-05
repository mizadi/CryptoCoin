//
//  AppError.swift
//  CryptoCoin
//
//  Created by Adi Mizrahi on 05/05/2025.
//

import Foundation

enum AppError: Identifiable, Error {
    var id: String { localizedDescription }

    case network(description: String)
    
    var localizedDescription: String {
        switch self {
        case .network(let description):
            return description
        }
    }
}
