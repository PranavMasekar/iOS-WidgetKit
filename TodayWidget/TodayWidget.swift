//
//  TodayWidget.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 23/07/25.
//

import SwiftUI
import WidgetKit

struct TodayWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "com.pranav.todayWidget",
            provider: TodayWidgetProvider()
        ) { entry in
            if #available(iOS 17.0, *) {
                TodayWidgetView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                TodayWidgetView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .contentMarginsDisabled()
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Today Widget")
        .description("Widget to show today's date")
    }
}

#Preview(as: .systemSmall) {
    TodayWidget()
} timeline: {
    TodayWidgetEntry(date: Date())
}
