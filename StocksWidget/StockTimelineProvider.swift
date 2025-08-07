//
//  StockTimelineProvider.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 07/08/25.
//

import SwiftUI
import WidgetKit

struct StockTimelineProvider: IntentTimelineProvider {
    
    typealias Entry = StockSymbolEntry
    
    typealias Intent = StockConfigurationIntent
    
    func placeholder(in context: Context) -> StockSymbolEntry {
        StockSymbolEntry(configuration: StockConfigurationIntent(), stock: nil)
    }
    
    func getSnapshot(for configuration: StockConfigurationIntent, in context: Context, completion: @escaping @Sendable (StockSymbolEntry) -> Void) {
        completion(
            StockSymbolEntry(configuration: StockConfigurationIntent(), stock: nil)
        )
    }
    
    func getTimeline(for configuration: StockConfigurationIntent, in context: Context, completion: @escaping @Sendable (Timeline<StockSymbolEntry>) -> Void) {
        Task {
            do {
                let stockData = try await StockService.getStockData(for: configuration.CustomStockSymbol?.identifier ?? "APPL")
                
                let timeline = Timeline(
                    entries: [StockSymbolEntry(configuration: configuration, stock: stockData)],
                    policy: .atEnd
                )
                
                completion(timeline)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
