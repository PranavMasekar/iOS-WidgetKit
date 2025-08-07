//
//  StockWidgetEntryView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 07/08/25.
//

import WidgetKit
import SwiftUI

struct StockWidgetEntryView: View {
    
    var entry: StockSymbolEntry
    
    var body: some View {
        VStack {
            if let stock = entry.stock {
                Text(stock.name)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Text(stock.price.formatted(.currency(code: "USD")))
                    .font(.title2.bold())
                    .foregroundStyle(
                        stock.price < stock.previousClose ?
                            Color.red.gradient : Color.green.gradient
                    )
                
                Text("Prev Close: \(stock.previousClose.formatted(.currency(code: "USD")))")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                
                Spacer()
            } else {
                Text("Choose a Stock Symbol from configuration")
            }
        } //: VStack
        .padding()
    }
}
