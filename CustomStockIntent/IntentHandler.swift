//
//  IntentHandler.swift
//  CustomStockIntent
//
//  Created by Pranav Masekar on 07/08/25.
//

import Intents

class IntentHandler: INExtension, StockConfigurationIntentHandling {
    func provideCustomStockSymbolOptionsCollection(for intent: StockConfigurationIntent) async throws -> INObjectCollection<CustomStockSymbol> {
        let stocks: [CustomStockSymbol] = [
            .init(identifier: "AAPL", display: "Apple"),
            .init(identifier: "MSFT", display: "Microsoft"),
            .init(identifier: "GOOGL", display: "Alphabet (Google)"),
            .init(identifier: "AMZN", display: "Amazon"),
            .init(identifier: "META", display: "Meta Platforms (Facebook)"),
            .init(identifier: "NVDA", display: "NVIDIA"),
            .init(identifier: "TSLA", display: "Tesla"),
            .init(identifier: "NFLX", display: "Netflix"),
            .init(identifier: "CRM", display: "Salesforce"),
            .init(identifier: "ADBE", display: "Adobe"),
            .init(identifier: "INTC", display: "Intel"),
            .init(identifier: "AMD", display: "AMD"),
            .init(identifier: "ORCL", display: "Oracle"),
            .init(identifier: "IBM", display: "IBM"),
            .init(identifier: "SAP", display: "SAP")
        ]
        
        let collection = INObjectCollection(items: stocks)
        
        return collection
    }
}
