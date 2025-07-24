//
//  PhotoWidget.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 24/07/25.
//

import SwiftUI
import WidgetKit

struct PhotoWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "com.pranav.photoWidget",
            provider: PhotoWidgetTimeLineProvider()
        ) { entry in
            if #available(iOS 17.0, *) {
                PhotoWidgetView(entry: entry)
                    .containerBackground(.clear, for: .widget)
            } else {
                PhotoWidgetView(entry: entry)
                    .padding()
                    .background()
            }
            
        }
        .supportedFamilies([.systemLarge])
        .contentMarginsDisabled()
        .description("Widget to show random photoes.")
        .configurationDisplayName("Photo Widget")
    }
}

#Preview(as: .systemLarge) {
    PhotoWidget()
} timeline: {
    PhotoWidgetEntry(
        date: Date(),
        imageUrl: "https://picsum.photos/600"
    )
}
