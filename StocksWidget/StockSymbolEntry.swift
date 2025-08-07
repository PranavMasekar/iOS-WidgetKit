//
//  StockSymbolEntry.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 07/08/25.
//

import WidgetKit
import SwiftUI

struct StockSymbolEntry: TimelineEntry {
    let date = Date()
    let configuration: StockConfigurationIntent
    let stock: Stock?
}
