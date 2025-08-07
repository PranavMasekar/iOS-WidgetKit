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

extension Stock {
    static var mock: Stock {
        return Stock(
            symbol: "AAPL",
            name: "Apple Inc.",
            price: 213.25,
            changesPercentage: 5.09068,
            change: 10.33,
            dayLow: 205.59,
            dayHigh: 215.38,
            yearHigh: 260.1,
            yearLow: 169.21,
            marketCap: 3_164_715_300_000,
            priceAvg50: 205.693,
            priceAvg200: 221.19266,
            exchange: "NASDAQ",
            volume: 99_651_873,
            avgVolume: 54_179_387,
            open: 205.6,
            previousClose: 222.92,
            eps: 7.26,
            pe: 29.37,
            earningsAnnouncement: "2025-10-30T04:00:00.000+0000",
            sharesOutstanding: 14_840_400_000,
            timestamp: 1754510403
        )
    }
}
