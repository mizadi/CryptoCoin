//
//  CoinStorage.swift
//  CryptoCoin
//
//  Created by Adi Mizrahi on 05/05/2025.
//

import CoreData

final class CoinStorage {
    private let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "CoinModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("CoreData error: \(error)")
            }
        }
    }

    func fetchCoins() -> [CryptoCurrency] {
        let context = container.viewContext
        let request = CoinEntity.fetchRequest()

        do {
            let entities = try context.fetch(request)
            return entities.map { CryptoCurrency(entity: $0) }
        } catch {
            return []
        }
    }

    func save(coins: [CryptoCurrency]) {
        let context = container.viewContext
        coins.forEach { coin in
            let entity = CoinEntity(context: context)
            entity.id = coin.id
            entity.name = coin.name
            entity.symbol = coin.symbol
            entity.image = coin.image
            entity.current_price = coin.current_price
            entity.price_change_percentage_24h = coin.price_change_percentage_24h
        }

        do {
            try context.save()
        } catch {
            print("Failed to save coins: \(error)")
        }
    }

    func clearAll() {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = CoinEntity.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print("Failed to clear data: \(error)")
        }
    }
}
