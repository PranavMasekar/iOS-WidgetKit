//
//  ExchangeRateApp.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 04/08/25.
//

import SwiftUI

struct ExchangeRateApp: View {
    
    @State private var selectedCountry: Country? = nil
    
    var body: some View {
        NavigationStack {
            
            VStack {
                List(Country.sample) { country in
                    CountryListCell(country: country)
                        .onTapGesture {
                            selectedCountry = country
                        }
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .sheet(item: $selectedCountry) { country in
                    CountryExchangeRateView(country: country)
                }
            }
            .navigationTitle("Exchange Rates")
            .onOpenURL { url in
                guard url.scheme == "sungod", url.host == "exchangerate" else {
                    return
                }
                
                selectedCountry = Country.sample.first(where: { country in
                    country.currencyCode == url.pathComponents[1]
                })
            }
            
        } //: NavigationStack
    }
}

#Preview {
    ExchangeRateApp()
}
