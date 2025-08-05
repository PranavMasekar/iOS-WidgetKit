//
//  ExchangeRateTimeLineProvider.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 05/08/25.
//

import SwiftUI
import WidgetKit

struct ExchangeRateTimeLineProvider: TimelineProvider {
    
    typealias Entry = ExchangeRateEntry
    
    func placeholder(in context: Context) -> ExchangeRateEntry {
        ExchangeRateEntry(countries: Country.sample, widgetFamily: context.family)
    }
    
    func getSnapshot(in context: Context, completion: @escaping @Sendable (ExchangeRateEntry) -> Void) {
        completion(ExchangeRateEntry(countries: Country.sample, widgetFamily: context.family))
    }
    
    func getTimeline(in context: Context, completion: @escaping @Sendable (Timeline<ExchangeRateEntry>) -> Void) {
        let entry = ExchangeRateEntry(countries: Country.sample, widgetFamily: context.family)
        
        completion(Timeline(entries: [entry], policy: .never))
    }
}
