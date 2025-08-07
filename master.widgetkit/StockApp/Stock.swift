//
//  Stock.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 07/08/25.
//

import Foundation

struct Stock: Codable {
    let symbol: String
    let name: String
    let price: Double
    let changesPercentage: Double
    let change: Double
    let dayLow: Double
    let dayHigh: Double
    let yearHigh: Double
    let yearLow: Double
    let marketCap: Double
    let priceAvg50: Double
    let priceAvg200: Double
    let exchange: String
    let volume: Int
    let avgVolume: Int
    let open: Double
    let previousClose: Double
    let eps: Double
    let pe: Double
    let earningsAnnouncement: String
    let sharesOutstanding: Int
    let timestamp: Int
}
