//
//  Country.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 04/08/25.
//

import Foundation

struct Country: Identifiable {
    let id = UUID()
    var name: String
    var flag: String
    var currencyCode: String
}

extension Country {
    static var USA: Country {
        .init(name: "United States of America", flag: "🇺🇸", currencyCode: "USD")
    }
    
    static var sample: [Country] {
        [
            .init(name: "India", flag: "🇮🇳", currencyCode: "INR"),
            .init(name: "Canada", flag: "🇨🇦", currencyCode: "CAD"),
            .init(name: "Australia", flag: "🇦🇺", currencyCode: "AUD"),
            .init(name: "Mexico", flag: "🇲🇽", currencyCode: "MXN"),
            .init(name: "Dominican Republic", flag: "🇩🇴", currencyCode: "DOP")
        ]
    }
}
