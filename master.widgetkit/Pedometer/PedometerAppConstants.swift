//
//  PedometerAppConstants.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 09/08/25.
//

import SwiftUI
import WidgetKit

struct PedometerAppConstants {
    static var stepsStorageKey = "totalSteps"
    static var appGroupName = "group.widgetkit"
    
    static var widgetKind = "com.pranav.pedoMeter"
    
    static func reloadPedoMeterTimelines() {
        WidgetCenter.shared.reloadTimelines(ofKind: Self.widgetKind)
    }
}
