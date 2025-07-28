//
//  WeatherTimeLineEntry.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 27/07/25.
//

import Foundation
import WidgetKit

struct WeatherTimeLineEntry: TimelineProvider {
    typealias Entry = WeatherWidgetEntry
    
    func placeholder(in context: Context) -> WeatherWidgetEntry {
        return WeatherWidgetEntry(date: Date(), weather: WeatherConstants.snapshotWeatherInfo)
    }
    
    func getSnapshot(in context: Context, completion: @escaping @Sendable (WeatherWidgetEntry) -> Void) {
        return completion(
            WeatherWidgetEntry(date: Date(), weather: WeatherConstants.snapshotWeatherInfo)
        )
    }
    
    func getTimeline(in context: Context, completion: @escaping @Sendable (Timeline<WeatherWidgetEntry>) -> Void) {
        
        let currentDate = Date()
        let refreshDate = Calendar.current.date(bySetting: .minute, value: 15, of: currentDate)!
        
        Task {
            do {
                
                let weather = try await WeatherService().getWeather()
                
                let entry = WeatherWidgetEntry(date: currentDate, weather: weather)
                
                let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
                
                return completion(timeline)
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
