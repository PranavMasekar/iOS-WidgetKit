//
//  ExpenseEntry.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 02/08/25.
//

import SwiftUI
import WidgetKit

struct ExpenseEntry: TimelineEntry {
    let date = Date()
    let category: ExpenseCategory
}
