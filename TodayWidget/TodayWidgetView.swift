//
//  TodayWidgetView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 23/07/25.
//

import SwiftUI
import WidgetKit

struct TodayWidgetView: View {
    
    let entry: TodayWidgetEntry
    
    var body: some View {
        VStack (spacing: 10) {
            Text(entry.date, format: .dateTime.month(.abbreviated))
                .font(.title)
                .foregroundStyle(.white)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .background(.red.gradient)
            
            Text(entry.date, format: .dateTime.day())
                .font(.largeTitle)
            
            Text(entry.date, style: .time)
                .font(.caption)
                .foregroundStyle(.secondary)
        } //: VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white.gradient, in: ContainerRelativeShape())
        .shadow(radius: 2)
    }
}
