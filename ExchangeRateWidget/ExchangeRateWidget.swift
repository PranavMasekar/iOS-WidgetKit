//
//  ExchangeRateWidget.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 05/08/25.
//

import SwiftUI
import WidgetKit

struct ExchangeRateWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "com.pranav.exchangeRateWidget",
            provider: ExchangeRateTimeLineProvider()
        ) { entry in
            if #available(iOS 17.0, *) {
                ExchangeRateEntryView(entry: entry)
                    .containerBackground(.clear, for: .widget)
            } else {
                ExchangeRateEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .contentMarginsDisabled()
        .supportedFamilies([.systemLarge, .systemMedium])
        .configurationDisplayName("Exchange Rate Widget")
        .description("Widget to show exchange rates around the world")
    }
}

#Preview(as: .systemLarge) {
    ExchangeRateWidget()
} timeline: {
    ExchangeRateEntry(countries: Country.sample, widgetFamily: .systemLarge)
}

#Preview(as: .systemMedium) {
    ExchangeRateWidget()
} timeline: {
    ExchangeRateEntry(countries: Country.sample, widgetFamily: .systemMedium)
}
