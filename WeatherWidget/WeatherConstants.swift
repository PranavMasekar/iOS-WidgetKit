//
//  WeatherConstants.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 27/07/25.
//

import Foundation

struct WeatherConstants {
    static var snapshotWeatherInfo: [Weather] {
        var weatherInfo = [Weather]()
        
        for i in 0 ... 9 {
            let weather = Weather(
                name: "Day \(i + 1)",
                temperature: 28,
                unit: "C",
                description: "Cloudy"
            )
            
            weatherInfo.append(weather)
        }
        
        return weatherInfo
    }
}
