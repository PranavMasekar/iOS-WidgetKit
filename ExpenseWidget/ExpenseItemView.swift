//
//  ExpenseItemView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 02/08/25.
//

import SwiftUI

struct ExpenseItemView: View {
    
    let label: String
    let amount: Double
    let budget: Double
    var color: Color
    
    var body: some View {
        ZStack {
            
            ContainerRelativeShape()
                .fill(color.gradient.opacity(0.6))
            
            VStack {
                
                Text(label)
                    .fontWeight(.bold)
                
                Spacer(minLength: 0)
                
                Gauge(value: amount, in: 0 ... budget) {
                    Text(label.split(separator: " ")[0])
                        .font(.caption)
                } currentValueLabel: {
                    Text("\(amount, specifier: "$%.0f")")
                        .font(.footnote)
                }
                .scaleEffect(1.5)
                .gaugeStyle(.accessoryCircular)
                .tint(color.gradient)
                .shadow(radius: 1)
                
                Spacer(minLength: 0)
                
            } //: VStack
            .foregroundStyle(.white)
            .padding(5)
            
        } //:ZStack
    }
}
