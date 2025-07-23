//
//  TodayWidgetProvider.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 23/07/25.
//

import WidgetKit

struct TodayWidgetProvider: TimelineProvider {
    typealias Entry = TodayWidgetEntry
    
    func placeholder(in context: Context) -> TodayWidgetEntry {
        return TodayWidgetEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping @Sendable (TodayWidgetEntry) -> Void) {
        return completion(TodayWidgetEntry(date: Date()))
    }
    
    func getTimeline(in context: Context, completion: @escaping @Sendable (Timeline<TodayWidgetEntry>) -> Void) {
        var entries = [TodayWidgetEntry]()
        
        let currentDateTime = Date()
        
        for minuteOffSet in 1...5 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffSet, to: currentDateTime)!
            
            let entry = TodayWidgetEntry(date: entryDate)
            
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        
        return completion(timeline)
    }
}
