//
//  ColorWidgetView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 31/07/25.
//

import SwiftUI
import WidgetKit

struct ColorWidgetView: View {
    
    let entry: ColorEntry
    
    private var backColor: Color {
        switch entry.backColor {
            
        case .unknown:
                .orange
        case .mint:
                .mint
        case .indigo:
                .indigo
        case .purple:
                .purple
        case .pink:
                .pink
        case .orange:
                .orange
        }
    }
    
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .foregroundStyle(backColor.gradient)
                .padding()
        }
    }
}
