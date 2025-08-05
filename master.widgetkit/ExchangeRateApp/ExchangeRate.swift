//
//  ExchangeRate.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 04/08/25.
//

import Foundation

struct ExchangeRate: Codable {
    let success: Bool
    let query: Query
    let info: Info
    let result: Double
}

struct Query: Codable {
    let from, to: String
    let amount: Int
}

struct Info: Codable {
    let quote: Double
}
