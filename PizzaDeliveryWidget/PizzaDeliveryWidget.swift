//
//  PizzaDeliveryWidget.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 11/08/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct PizzaDeliveryWidget: Widget {
    
    private func orderStatusMessage(status: OrderStatus) -> String {
        switch status {
        case .received:
            return "Got the order."
        case .inProgress:
            return "We are working on your order."
        case .inOven:
            return "Pizza is baking in oven!"
        case .onTheWay:
            return "It's ready and on the way"
        }
    }
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PizzaOrderAttributes.self) { context in
            ZStack {
                
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundStyle(.orange.gradient)
                
                VStack {
                    
                    HStack {
                        Text("Pranav")
                            .foregroundStyle(.white.opacity(0.5))
                        
                        Spacer()
                        
                        Text("\(context.attributes.orderedItem) status")
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    
                    HStack (alignment: .bottom, spacing: 0) {
                        Image(systemName: context.state.self.status.rawValue)
                            .font(.largeTitle)
                        
                        Text(orderStatusMessage(status: context.state.status))
                            .font(.title3)
                    }
                    .foregroundStyle(.white)
                    
                } //: VStack
                .padding(20)
            } //: ZStack
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    Image(systemName: context.state.status.rawValue)
                }
            } compactLeading: {
                Image(systemName: context.state.status.rawValue)
            } compactTrailing: {
                EmptyView()
            } minimal: {
                EmptyView()
            }
        }

    }
}
