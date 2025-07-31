//
//  GroceryEntryView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 31/07/25.
//

import SwiftUI

struct GroceryEntryView: View {
    
    let entry: GroceryEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(systemName: "list.bullet.circle.fill")
                    .foregroundStyle(.orange)
                
                Text("Grocery")
                    .font(.title2)
            } //: HStack
            
            Rectangle()
                .foregroundStyle(.orange.gradient.opacity(0.4))
                .frame(height: 1)
            
            VStack (alignment: .leading) {
                ForEach (entry.items) { item in
                    HStack {
                        Color(hex: item.color ?? "#FF5733")
                            .frame(width: 5, height: 20)
                        
                        Text(item.name ?? "")
                            .lineLimit(1)
                    }
                    .font(.subheadline)
                }
            }
            .padding(.top, 5)
            
            Spacer(minLength: 0)
            
        } //: VStack
        .padding()
    }
}
