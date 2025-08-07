//
//  StockView.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 07/08/25.
//

import SwiftUI

struct StockView: View {
    
    @State private var stock: Stock?
    
    var body: some View {
        VStack (alignment: .leading) {
            if let stock = stock {
                
                Text(stock.symbol)
                    .fontWeight(.bold)
                    
                
                Text(stock.name)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(stock.price.formatted(.currency(code: "USD")))
                    .font(.title2.bold())
                    .foregroundStyle(
                        stock.price < stock.previousClose ?
                            Color.red.gradient : Color.green.gradient
                    )
            } else {
                Text("Nothing to see")
            }
        }
        .onAppear {
            Task {
                do {
                    let fetchedStock = try await StockService.getStockData(for: "AAPL")
                    
                    stock = fetchedStock
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    StockView()
}
