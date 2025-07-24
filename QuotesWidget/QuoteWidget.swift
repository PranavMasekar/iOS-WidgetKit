//
//  QuoteWidget.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 24/07/25.
//

import SwiftUI
import WidgetKit

struct QuoteWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "com.pranav.quotesWidget",
            provider: QuoteTimeLineProvider()
        ) { entry in
            if #available(iOS 17.0, *) {
                QuoteWidgetView(entry: entry)
                    .containerBackground(.orange.opacity(0.5), for: .widget)
            } else {
                QuoteWidgetView(entry: entry)
                    .padding()
                    .background()   
            }
        }
        .contentMarginsDisabled()
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Famous Quotes")
        .description("Widget to display famous quotes")
    }
}

#Preview(as: .systemMedium) {
    QuoteWidget()
} timeline: {
    QuoteWidgetEntry(
        date: Date(),
        quote: Quote(
            quoteText: "GOAT means Greatest of All Time",
            quoteAuthor: "Pranav Masekar"
        )
    )
}
