//
//  DevWidgetsBundle.swift
//  DevWidgets
//
//  Created by Pranav Masekar on 23/07/25.
//

import WidgetKit
import SwiftUI

@main
struct DevWidgetsBundle: WidgetBundle {
    var body: some Widget {
        HelloStaticWidget()
        TodayWidget()
        QuoteWidget()
    }
}
