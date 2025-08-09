//
//  PedometerWidget.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 09/08/25.
//

import WidgetKit
import SwiftUI

struct PedometerWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: PedometerAppConstants.widgetKind,
            provider: PedometerTimelineProvider()
        ) { entry in
            if #available(iOS 17.0, *) {
                PedometerEntryView(entry: entry)
                    .containerBackground(.clear, for: .widget)
            } else {
                PedometerEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .contentMarginsDisabled()
        .supportedFamilies([.accessoryCircular])
        .configurationDisplayName("LockScreen Pedometer Widget")
        .description("Widget to show on lock screen")
    }
}

#Preview(as: .systemSmall) {
    PedometerWidget()
} timeline: {
    PedometerEntry(steps: 200)
}

