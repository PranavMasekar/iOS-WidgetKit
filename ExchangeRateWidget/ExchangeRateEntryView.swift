//
//  ExchangeRateEntryView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 05/08/25.
//

import SwiftUI
import WidgetKit

struct ExchangeRateEntryView: View {
    
    let entry: ExchangeRateEntry
    
    var body: some View {
        VStack {
            let rows = entry.widgetFamily == .systemMedium ? 2 : 4
            
            ForEach(entry.countries.prefix(rows)) { country in
                Link(destination: URL(string: "sungod://exchangerate/\(country.currencyCode)")!) {
                    CountryListCell(country: country)
                }
            }
        } //: VStack
    }
}
