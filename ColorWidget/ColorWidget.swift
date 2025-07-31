//
//  ColorWidget.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 31/07/25.
//

import SwiftUI
import WidgetKit

struct ColorWidget: Widget {
    var body: some WidgetConfiguration {
        IntentConfiguration(
            kind: "com.pranav.colorWidget",
            intent: ColorSelectionIntentIntent.self,
            provider: ColorWidgetTimeLineProvider()
        ) { entry in
            if #available(iOS 17.0, *) {
                ColorWidgetView(entry: entry)
                    .containerBackground(.clear, for: .widget)
            } else {
                ColorWidgetView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .contentMarginsDisabled()
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Color Widget")
        .description("Widget to show configurable widget")
    }
}


#Preview(as: .systemSmall) {
    ColorWidget()
} timeline: {
    ColorEntry(backColor: .indigo)
}
