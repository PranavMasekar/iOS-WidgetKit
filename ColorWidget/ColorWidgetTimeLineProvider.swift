//
//  ColorWidgetTimeLineProvider.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 31/07/25.
//

import SwiftUI
import WidgetKit

struct ColorWidgetTimeLineProvider: IntentTimelineProvider {
    
    typealias Entry = ColorEntry
    
    typealias Intent = ColorSelectionIntentIntent
    
    func placeholder(in context: Context) -> ColorEntry {
        ColorEntry(backColor: .orange)
    }
    
    func getSnapshot(for configuration: ColorSelectionIntentIntent, in context: Context, completion: @escaping @Sendable (ColorEntry) -> Void) {
        completion(ColorEntry(backColor: .orange))
    }
    
    func getTimeline(for configuration: ColorSelectionIntentIntent, in context: Context, completion: @escaping @Sendable (Timeline<ColorEntry>) -> Void) {
        completion(Timeline(entries: [ColorEntry(backColor: configuration.backColor)], policy: .never))
    }
}
