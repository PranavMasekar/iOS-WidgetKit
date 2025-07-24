//
//  QuoteWidgetView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 24/07/25.
//

import SwiftUI

struct QuoteWidgetView: View {
    
    let entry: QuoteWidgetEntry
    
    var body: some View {
        VStack (spacing: 5) {
            Text(entry.quote.quoteText)
                .minimumScaleFactor(0.7)
            
            HStack {
                Spacer()
                Text("-")
                Text(entry.quote.quoteAuthor)
                    .italic()
            }
            .font(.footnote)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
