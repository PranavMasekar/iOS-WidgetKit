//
//  DailyWeatherView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 28/07/25.
//

import SwiftUI

struct DailyWeatherView: View {
    
    let weather: Weather
    
    var body: some View {
        VStack(spacing: 0) {
            Text(weather.name.lowercased().contains("night") ? "🌕" : "☀️")
            
            Text("\(weather.temperature) \(weather.unit)")
            
            Text(WeatherUtil.weatherIcon(by: weather.description))
        }
        .padding(5)
    }
}

