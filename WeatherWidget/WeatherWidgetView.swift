//
//  WeatherWidgetView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 28/07/25.
//

import SwiftUI

struct WeatherWidgetView: View {
    
    var entry: WeatherWidgetEntry
    @Environment(\.widgetFamily) var widgetFamily
    
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            WeatherView(weather: entry.weather[0], updateDate: entry.date, backColor: .orange, showDate: true)
        case .systemMedium:
            HStack (spacing: 0) {
                WeatherView(weather: entry.weather[0], updateDate: entry.date, backColor: .orange, showDate: false)
                
                WeatherView(weather: entry.weather[1], updateDate: entry.date, backColor: .indigo, showDate: true)
            }
        case .systemLarge:
            VStack {
                HStack (spacing: 0) {
                    WeatherView(weather: entry.weather[0], updateDate: entry.date, backColor: .orange, showDate: false)
                    
                    WeatherView(weather: entry.weather[1], updateDate: entry.date, backColor: .indigo, showDate: true)
                }
                
                HStack(spacing: 40) {
                    VStack (spacing: 0) {
                        DailyWeatherView(weather: entry.weather[2])
                        DailyWeatherView(weather: entry.weather[3])
                    }
                    
                    VStack (spacing: 0) {
                        DailyWeatherView(weather: entry.weather[4])
                        DailyWeatherView(weather: entry.weather[5])
                    }
                    
                    VStack (spacing: 0) {
                        DailyWeatherView(weather: entry.weather[6])
                        DailyWeatherView(weather: entry.weather[7])
                    }
                    
                    VStack (spacing: 0) {
                        DailyWeatherView(weather: entry.weather[8])
                        DailyWeatherView(weather: entry.weather[9])
                    }
                }
            }
        default:
            Text("How you doin")
        }
    }
}
