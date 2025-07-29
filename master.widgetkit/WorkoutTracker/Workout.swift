//
//  Workout.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 29/07/25.
//

import Foundation

struct Workout: Identifiable {
    let id = UUID()
    let day: String
    let minutes: Int
}

extension Workout {
    static var sample: [Workout] {
        [
            Workout(day: "Mon", minutes: Int.random(in: 20..<60)),
            Workout(day: "Tue", minutes: Int.random(in: 20..<60)),
            Workout(day: "Wed", minutes: Int.random(in: 20..<60)),
            Workout(day: "Thu", minutes: Int.random(in: 20..<60)),
            Workout(day: "Fri", minutes: Int.random(in: 20..<60)),
            Workout(day: "Sat", minutes: Int.random(in: 20..<60)),
            Workout(day: "Sun", minutes: Int.random(in: 20..<60)),
        ]
    }
}
