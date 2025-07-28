//
//  WeatherWidgetEntry.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 27/07/25.
//

import Foundation
import WidgetKit

struct WeatherWidgetEntry: TimelineEntry {
    var date: Date
    let weather: [Weather]
}
