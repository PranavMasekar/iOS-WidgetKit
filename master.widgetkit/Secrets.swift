//
//  Secrets.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 07/08/25.
//

import Foundation

enum Secrets {
    static var fmpApiKey: String {
        guard
            let url = Bundle.main.url(forResource: "Secrets", withExtension: "plist"),
            let data = try? Data(contentsOf: url),
            let plist = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any],
            let key = plist["FMP_API_KEY"] as? String
        else {
            fatalError("FMP_API_KEY not found in Secrets.plist")
        }
        return key
    }
}
