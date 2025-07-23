//
//  HelloWidgetTimelineProvider.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 23/07/25.
//

import WidgetKit

struct HelloWidgetTimelineProvider: TimelineProvider {
    
    typealias Entry = HelloWidgetEntry
    
    func placeholder(in context: Context) -> HelloWidgetEntry {
        return HelloWidgetEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping @Sendable (HelloWidgetEntry) -> Void) {
        return completion(HelloWidgetEntry(date: Date()))
    }
    
    func getTimeline(in context: Context, completion: @escaping @Sendable (Timeline<HelloWidgetEntry>) -> Void) {
        return completion(Timeline(entries: [HelloWidgetEntry(date: Date())], policy: .never))
    }
}
