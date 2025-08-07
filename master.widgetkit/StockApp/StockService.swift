//
//  StockService.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 07/08/25.
//

import Foundation

struct StockService {
    static let apiKey = Secrets.fmpApiKey

    static func getStockData(for symbol: String) async throws -> Stock {
        guard let url = URL(string: "https://financialmodelingprep.com/api/v3/quote/\(symbol)?apikey=\(apiKey)") else {
            fatalError("Invalid URL")
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            fatalError("Invalid Response")
        }

        let stocks = try JSONDecoder().decode([Stock].self, from: data)

        guard let stock = stocks.first else {
            fatalError("Stock not found")
        }

        return stock
    }
}
