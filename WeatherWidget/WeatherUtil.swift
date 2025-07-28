//
//  WeatherUtil.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 27/07/25.
//

import Foundation

struct WeatherUtil {
    static func weatherIcon(by condition: String) -> String {
        let current = condition.lowercased()
        
        switch current {
        case _ where current.contains("partly sunny"):
            return "🌤️"
        
        case _ where current.contains("light_rain"):
            return "☔️"
            
        case _ where current.contains("sunny"):
            return "☀️"
            
        case _ where current.contains("clear"):
            return "👺"
            
        case _ where current.contains("fog"):
            return "🌫️"
        
        case _ where current.contains("snow"):
            return "❄️"
            
        default:
            return "🌧️"
        }
    }
}
