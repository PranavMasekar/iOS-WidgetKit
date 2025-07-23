//
//  HelloWidgetView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 23/07/25.
//

import SwiftUI
import WidgetKit

struct HelloWidgetView: View {
    var body: some View {
        ZStack {
            
            ContainerRelativeShape()
                .fill(.orange.gradient)
            
            VStack {
                Text("Hello")
                    .font(.title3)
                
                Text("World")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.indigo.gradient)
            }
        }
    }
}
