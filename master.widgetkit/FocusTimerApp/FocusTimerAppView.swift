//
//  FocusTimerAppView.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 11/08/25.
//

import SwiftUI
import ActivityKit

struct FocusTimerAppView: View {
    
    @State private var timerName = "Focus Timer"
    @State private var focusTime = 20.0
    @State private var activity: Activity<FocustTimerAttributes>? = nil
    @State private var timerSet = false
    
    private func startTimer() {
        let attributes = FocustTimerAttributes(timerName: timerName)
        
        let state = FocustTimerAttributes.ContentState(
            endTime: Date().addingTimeInterval(60 * focusTime)
        )
        
        activity = try? Activity<FocustTimerAttributes>.request(
            attributes: attributes,
            contentState: state,
            pushType: nil
        )
        
        timerSet = true
    }
    
    private func stopTimer() {
        let state = FocustTimerAttributes.ContentState(endTime: .now)
        
        Task {
            await activity?.end(using: state, dismissalPolicy: .immediate)
            timerSet = false
        }
    }
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                if timerSet {
                    Text("Timer in progress!!!")
                } else {
                    TextField("Enter timer name", text: $timerName)
                        .textFieldStyle(.roundedBorder)
                    
                    Text("Focus time: \(focusTime.formatted())")
                        .font(.title3)
                    
                    Stepper(
                        "Adjust Focus Time",
                        value: $focusTime,
                        in: 10...60,
                        step: 5
                    )
                }
                
                HStack {
                    
                    Button("Start Timer") {
                        startTimer()
                    }
                    
                    Button("Stop Timer") {
                        stopTimer()
                    }
                    
                } //: HStack
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
                
            } //: VStack
            .padding()
            .navigationTitle("Focus Timer")
            
        } //: NavigationStack
    }
}

#Preview {
    FocusTimerAppView()
}
