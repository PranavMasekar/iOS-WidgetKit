//
//  ExchangeRateEntry.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 04/08/25.
//

import WidgetKit

struct ExchangeRateEntry: TimelineEntry {
    let date = Date()
    let countries : [Country]
    let widgetFamily : WidgetFamily
}
