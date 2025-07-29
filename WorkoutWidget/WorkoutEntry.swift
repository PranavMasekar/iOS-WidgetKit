//
//  WorkoutEntry.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 29/07/25.
//

import WidgetKit

struct WorkoutEntry: TimelineEntry {
    var date: Date
    var workoutData: [Workout]
    let widgetFamily: WidgetFamily
}
