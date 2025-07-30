//
//  RemindersConstants.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 30/07/25.
//

import Foundation
import WidgetKit

struct RemindersConstants {
    static var storageKey = "totalReminders"
    static var appGroupName = "group.widgetkit"
    
    static var widgetKind = "com.pranav.reminderWidget"
    
    static func reloadRemindersTimeline() {
        WidgetCenter.shared.reloadTimelines(ofKind: Self.widgetKind)
    }
}
