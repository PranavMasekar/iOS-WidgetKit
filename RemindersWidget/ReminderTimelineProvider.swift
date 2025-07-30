//
//  ReminderTimelineProvider.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 30/07/25.
//

import SwiftUI
import WidgetKit

struct ReminderTimelineProvider: TimelineProvider {
    
    typealias Entry = ReminderWidgetEntry
    
    func placeholder(in context: Context) -> ReminderWidgetEntry {
        return ReminderWidgetEntry(remindersCount: 2)
    }
    
    func getSnapshot(in context: Context, completion: @escaping @Sendable (ReminderWidgetEntry) -> Void) {
        completion(ReminderWidgetEntry(remindersCount: 4))
    }
    
    func getTimeline(in context: Context, completion: @escaping @Sendable (Timeline<ReminderWidgetEntry>) -> Void) {
        let entry = ReminderWidgetEntry(remindersCount: getData())
        
        completion(Timeline(entries: [entry], policy: .never))
    }
    
    func getData() -> Int {
        let defaults = UserDefaults(suiteName: RemindersConstants.appGroupName)
        
        return defaults?.value(forKey: RemindersConstants.storageKey) as? Int ?? 0
    }
}
