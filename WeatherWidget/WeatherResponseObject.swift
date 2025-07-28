//
//  WeatherResponseObject.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 27/07/25.
//

import Foundation

struct WeatherResponseObject: Codable {
    let forecast: [Weather]
}
