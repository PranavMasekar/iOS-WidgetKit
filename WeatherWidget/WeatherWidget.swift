//
//  WeatherWidget.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 27/07/25.
//

import Foundation
import WidgetKit
import SwiftUI

struct WeatherWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "com.pranav.weatherWidget",
            provider: WeatherTimeLineEntry()
        ) { entry in
            if #available(iOS 17.0, *) {
                WeatherWidgetView(entry: entry)
                    .containerBackground(.clear, for: .widget)
            } else {
                WeatherWidgetView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .contentMarginsDisabled()
        .supportedFamilies([.systemSmall, .systemLarge, .systemMedium])
        .configurationDisplayName("NY Weather")
        .description("Widget to display NewYork Weather")
    }
}



#Preview(as: .systemSmall) {
    WeatherWidget()
} timeline: {
    WeatherWidgetEntry(
        date: Date(),
        weather: WeatherConstants.snapshotWeatherInfo
    )
}

#Preview(as: .systemMedium) {
    WeatherWidget()
} timeline: {
    WeatherWidgetEntry(
        date: Date(),
        weather: WeatherConstants.snapshotWeatherInfo
    )
}

#Preview(as: .systemLarge) {
    WeatherWidget()
} timeline: {
    WeatherWidgetEntry(
        date: Date(),
        weather: WeatherConstants.snapshotWeatherInfo
    )
}
