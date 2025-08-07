//
//  StockWidget.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 07/08/25.
//

import SwiftUI
import WidgetKit

struct StockWidget: Widget {
    var body: some WidgetConfiguration {
        IntentConfiguration(
            kind: "com.pranav.stockWidget",
            intent: StockConfigurationIntent.self,
            provider: StockTimelineProvider()
        ) { entry in
            if #available(iOS 17.0, *) {
                StockWidgetEntryView(entry: entry)
                    .containerBackground(.clear, for: .widget)
            } else {
                StockWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .contentMarginsDisabled()
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Stock Widget")
        .description("Widget to show latest stock prices")
    }
}


#Preview(as: .systemSmall) {
    StockWidget()
} timeline: {
    StockSymbolEntry(configuration: StockConfigurationIntent(), stock: Stock.mock)
}

