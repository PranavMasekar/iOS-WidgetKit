//
//  ReminderWidget.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 30/07/25.
//

import SwiftUI
import WidgetKit

struct ReminderWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: RemindersConstants.widgetKind,
            provider: ReminderTimelineProvider()
        ) { entry in
            if #available(iOS 17.0, *) {
                ReminderWidgetView(count: entry.remindersCount)
                    .containerBackground(.clear, for: .widget)
            } else {
                ReminderWidgetView(count: entry.remindersCount)
                    .padding()
                    .background()
            }
        }
        .contentMarginsDisabled()
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Reminder Widget")
        .description("Widget to show total reminders")
    }
}

#Preview(as: .systemSmall) {
    ReminderWidget()
} timeline: {
    ReminderWidgetEntry(remindersCount: 2)
}
