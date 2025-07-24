//
//  QuoteTimeLineProvider.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 24/07/25.
//

import WidgetKit
import SwiftUI

struct QuoteTimeLineProvider: TimelineProvider {
    typealias Entry = QuoteWidgetEntry
    
    let placeholderQuote = Quote(
        quoteText: "GOAT means Greatest of All Time",
        quoteAuthor: "Pranav Masekar"
    )
    
    func placeholder(in context: Context) -> QuoteWidgetEntry {
        return QuoteWidgetEntry(date: Date(), quote: placeholderQuote)
    }
    
    func getSnapshot(in context: Context, completion: @escaping @Sendable (QuoteWidgetEntry) -> Void) {
        return completion(QuoteWidgetEntry(date: Date(), quote: placeholderQuote))
    }
    
    func getTimeline(in context: Context, completion: @escaping @Sendable (Timeline<QuoteWidgetEntry>) -> Void) {
        Task {
            do {
                let quote = try await QuoteService().getQuote()
                
                let entry = QuoteWidgetEntry(date: Date(), quote: quote)
                
                let refreshTime = Calendar.current.date(byAdding: .second, value: 30, to: Date())!
                
                let timeline = Timeline(entries: [entry], policy: .after(refreshTime))
                
                return completion(timeline)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
