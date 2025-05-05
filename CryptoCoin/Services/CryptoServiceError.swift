//
//  CryptoError.swift
//  CryptoCoin
//
//  Created by Adi Mizrahi on 05/05/2025.
//

import Foundation

enum CryptoServiceError: Error, LocalizedError {
    case invalidURL
    case decodingError
    case networkError(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid API URL."
        case .decodingError:
            return "Failed to decode the response."
        case .networkError(let error):
            return error.localizedDescription
        }
    }
}
