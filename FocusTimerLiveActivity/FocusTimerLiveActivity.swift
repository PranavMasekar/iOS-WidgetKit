//
//  FocusTimerLiveActivity.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 11/08/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct FocusTimerLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: FocustTimerAttributes.self) { context in
            FocusTimerEntryView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    Image(systemName: "alarm")
                }
            } compactLeading: {
                EmptyView()
            } compactTrailing: {
                EmptyView()
            } minimal: {
                EmptyView()
            }
        }

    }
}
