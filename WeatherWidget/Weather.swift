//
//  Weather.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 27/07/25.
//

import Foundation

struct Weather: Codable {
    var name: String
    var temperature: Int
    var unit: String
    var description: String
}
