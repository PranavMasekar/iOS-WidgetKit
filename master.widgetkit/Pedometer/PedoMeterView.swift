//
//  PedoMeterView.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 09/08/25.
//

import SwiftUI

struct PedoMeterView: View {
    
    @AppStorage(
        PedometerAppConstants.stepsStorageKey,
        store: UserDefaults(suiteName: PedometerAppConstants.appGroupName)
    ) private var stepsStorage: Int = 0
    
    @StateObject private var manager = PedometerManager()
    
    var body: some View {
        ZStack {
            
            Circle()
                .foregroundStyle(.orange.gradient)
                .frame(width: 300, height: 300)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.gray.gradient.opacity(0.5))
                .frame(width: 250, height: 100)
            
            Text("\(manager.pedometer.steps) Steps")
                .font(.custom("Academy Engraved LET", size: 44))
                .foregroundStyle(.white)
        } //: ZStack
        .onSubmit {
            manager.refreshData()
        }
        .onReceive(manager.objectWillChange) { _ in
            stepsStorage = manager.pedometer.steps
            PedometerAppConstants.reloadPedoMeterTimelines()
        }
    }
}

#Preview {
    PedoMeterView()
}
