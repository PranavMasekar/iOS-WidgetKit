//
//  ReminderWidgetView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 30/07/25.
//

import SwiftUI
import WidgetKit

struct ReminderWidgetView: View {
    
    let count: Int
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.largeTitle)
            
            Text("Reminder\(count > 1 ? "s" : "")")
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.purple.gradient)
        .cornerRadius(8)
    }
}
