//
//  FocustTimerAttributes.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 11/08/25.
//

import ActivityKit
import SwiftUI

struct FocustTimerAttributes: ActivityAttributes {
    
    var timerName: String
    
    public struct ContentState : Codable, Hashable {
        var endTime: Date
    }    
}
