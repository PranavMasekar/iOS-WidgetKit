//
//  GroceryEntry.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 31/07/25.
//

import WidgetKit
import SwiftUI

struct GroceryEntry : TimelineEntry {
    let date = Date()
    var items = [Item]()
}
