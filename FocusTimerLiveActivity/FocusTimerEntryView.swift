//
//  FocusTimerEntryView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 11/08/25.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct FocusTimerEntryView: View {
    
    let context: ActivityViewContext<FocustTimerAttributes>
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.orange.gradient.opacity(0.5))
            
            HStack {
                Text(context.state.endTime, style: .timer)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                Text(context.attributes.timerName)
                    .font(.body)
            }
            .padding(.horizontal)
        } //: ZStack
    }
}
