//
//  WorkoutTimeLineProvider.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 29/07/25.
//

import WidgetKit
import SwiftUI

struct WorkoutTimeLineProvider: TimelineProvider {
    
    typealias Entry = WorkoutEntry
    
    private let workoutData = Workout.sample
    
    func placeholder(in context: Context) -> WorkoutEntry {
        return WorkoutEntry(date: Date(), workoutData: workoutData, widgetFamily: context.family)
    }
    
    func getSnapshot(in context: Context, completion: @escaping @Sendable (WorkoutEntry) -> Void) {
        return completion(WorkoutEntry(date: Date(), workoutData: workoutData, widgetFamily: context.family))
    }
    
    func getTimeline(in context: Context, completion: @escaping @Sendable (Timeline<WorkoutEntry>) -> Void) {
        let currentDate = Date()
        
        let entry = WorkoutEntry(date: currentDate, workoutData: workoutData, widgetFamily: context.family)
        
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 1, to: currentDate)!
        
        let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
        
        return completion(timeline)
    }
}
