//
//  PedometerTimelineProvider.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 09/08/25.
//

import WidgetKit

struct PedometerTimelineProvider: TimelineProvider {
    
    typealias Entry = PedometerEntry
    
    func placeholder(in context: Context) -> PedometerEntry {
        PedometerEntry(steps: 2000)
    }
    
    func getSnapshot(in context: Context, completion: @escaping @Sendable (PedometerEntry) -> Void) {
        completion(PedometerEntry(steps: 2000))
    }
    
    func getTimeline(in context: Context, completion: @escaping @Sendable (Timeline<PedometerEntry>) -> Void) {
        let defaults = UserDefaults(suiteName: PedometerAppConstants.appGroupName)
        
        let steps = defaults?.integer(forKey: PedometerAppConstants.stepsStorageKey) ?? 0
        
        completion(
            Timeline(entries: [PedometerEntry(steps: steps)], policy: .never)
        )
    }
}
