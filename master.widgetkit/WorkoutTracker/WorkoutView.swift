//
//  WorkoutView.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 29/07/25.
//

import SwiftUI
import Charts

struct WorkoutView: View {
    
    var workoutData = Workout.sample
    var showLineChart = true
    
    var body: some View {
        VStack {
            Text("Workout Tracker")
                .font(.subheadline)
            
            Chart(workoutData) { workout in
                if showLineChart {
                    AreaMark(
                        x: .value("Day", workout.day),
                        y: .value("Mins", workout.minutes)
                    )
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(
                        Gradient(
                            colors: [
                                .blue.opacity(0.3),
                                .clear
                            ]
                        )
                    )
                    
                    LineMark(
                        x: .value("Day", workout.day),
                        y: .value("Mins", workout.minutes)
                    )
                    .interpolationMethod(.catmullRom)
                    
                    PointMark(
                        x: .value("Day", workout.day),
                        y: .value("Mins", workout.minutes)
                    )
                    .annotation (position: .leading) {
                        Text(workout.minutes.formatted())
                            .font(.caption2)
                    }
                } else {
                    BarMark(
                        x: .value("Day", workout.day),
                        y: .value("Mins", workout.minutes)
                    )
                    .foregroundStyle(by: .value("Day", workout.day))
                    .annotation {
                        Text("\(workout.minutes) m")
                            .font(.caption2)
                    }
                }
            }
            .chartLegend(.hidden)
        } //:VStack
        .padding()
    }
}

#Preview {
    WorkoutView()
}


#Preview {
    WorkoutView(showLineChart: false)
}
