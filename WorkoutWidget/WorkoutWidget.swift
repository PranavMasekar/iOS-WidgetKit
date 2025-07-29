//
//  WorkoutWidget.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 29/07/25.
//

import SwiftUI
import WidgetKit

struct WorkoutWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "com.pranav.workoutWidget",
            provider: WorkoutTimeLineProvider()
        ) { entry in
            
            let showLineChart = entry.widgetFamily == .systemMedium ? true : false
            
            if #available(iOS 17.0, *) {
                WorkoutView(workoutData: entry.workoutData, showLineChart: showLineChart)
                    .containerBackground(.clear, for: .widget)
            } else {
                WorkoutView(workoutData: entry.workoutData, showLineChart: showLineChart)
                    .padding()
                    .background()
            }
        }
        .contentMarginsDisabled()
        .supportedFamilies([.systemMedium, .systemLarge])
        .configurationDisplayName("Workout Tracker")
        .description("Widget to display workout data")
    }
}

#Preview(as: .systemLarge) {
    WorkoutWidget()
} timeline: {
    WorkoutEntry(
        date: Date(),
        workoutData: Workout.sample,
        widgetFamily: .systemLarge
    )
}

#Preview(as: .systemMedium) {
    WorkoutWidget()
} timeline: {
    WorkoutEntry(
        date: Date(),
        workoutData: Workout.sample,
        widgetFamily: .systemMedium
    )
}

