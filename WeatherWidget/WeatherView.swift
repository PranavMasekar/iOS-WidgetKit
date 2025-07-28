//
//  WeatherView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 27/07/25.
//

import SwiftUI

struct WeatherView: View {
    
    let weather: Weather
    let updateDate: Date
    let backColor: Color
    let showDate: Bool
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(backColor)
                .padding()
            
            VStack {
                Text(weather.name)
                
                Text("\(weather.temperature) \(weather.unit)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(WeatherUtil.weatherIcon(by: weather.description))
                
                Text(weather.description)
                    .font(.caption2)
            }
            .foregroundStyle(.white)
            .padding()
            
            if showDate {
                VStack {
                    Spacer()
                    
                    Text("Updated: " + updateDate.formatted(date: .omitted, time: .shortened))
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }
            }
        }
        
    }
}
