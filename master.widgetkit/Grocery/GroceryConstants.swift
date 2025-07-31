//
//  GroceryConstants.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 31/07/25.
//

import Foundation
import SwiftUI
import WidgetKit

struct GroceryConstants {
    static var appGroupContainerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.widgetkit")!
    
    static var randomColor: Color {
        Color (
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
    
    static var widgetKind = "com.pranav.groceryWidget"
    
    static func reloadGroceryTimelines() {
        WidgetCenter.shared.reloadTimelines(ofKind: Self.widgetKind)
    }
}
