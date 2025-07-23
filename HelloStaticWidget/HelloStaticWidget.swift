//
//  HelloStaticWidget.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 23/07/25.
//

import WidgetKit
import SwiftUI

struct HelloStaticWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "com.pranav.helloStaticWidget",
            provider: HelloWidgetTimelineProvider()
        ) { _ in
            if #available(iOS 17.0, *) {
                HelloWidgetView()
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                HelloWidgetView()
                    .padding()
                    .background()
            }
        }
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    HelloStaticWidget()
} timeline: {
    HelloWidgetEntry(date: Date())
}
