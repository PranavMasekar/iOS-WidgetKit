//
//  GroceryWidget.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 31/07/25.
//

import SwiftUI
import WidgetKit

struct GroceryWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: GroceryConstants.widgetKind,
            provider: GroceryTimeLineProvider()
        ) { entry in
            if #available(iOS 17.0, *) {
                GroceryEntryView(entry: entry)
                    .containerBackground(.clear, for: .widget)
            } else {
                GroceryEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .contentMarginsDisabled()
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .configurationDisplayName("Grocery Widget")
        .description("Widget to show latest grocery items")
    }
}

#Preview(as: .systemSmall) {
    GroceryWidget()
} timeline: {
    GroceryEntry()
}
