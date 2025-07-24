//
//  PhotoWidgetTimeLineProvider.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 24/07/25.
//

import WidgetKit

struct PhotoWidgetTimeLineProvider: TimelineProvider {
    
    typealias Entry = PhotoWidgetEntry
    
    func placeholder(in context: Context) -> PhotoWidgetEntry {
        PhotoWidgetEntry(date: Date(), imageUrl: "https://picsum.photos/600")
    }
    
    func getSnapshot(in context: Context, completion: @escaping @Sendable (PhotoWidgetEntry) -> Void) {
        completion(PhotoWidgetEntry(date: Date(), imageUrl: "https://picsum.photos/600"))
    }
    
    func getTimeline(in context: Context, completion: @escaping @Sendable (Timeline<PhotoWidgetEntry>) -> Void) {
        var entries = [PhotoWidgetEntry]()
        let currentDate = Date()
        
        for i in 1...5 {
            let nextDate = Calendar.current.date(byAdding: .minute, value: i, to: currentDate)!
            
            let entry = PhotoWidgetEntry(date: nextDate, imageUrl: "https://picsum.photos/600")
            
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        
        return completion(timeline)
    }
}
