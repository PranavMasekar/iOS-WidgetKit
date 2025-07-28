//
//  WeatherService.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 27/07/25.
//

import Foundation

struct WeatherService {
    func getWeather() async throws -> [Weather] {
        let urlString = "https://api.lil.software/weather?latitude=40.71302914226243&longitude=-74.00606120853008"
        
        guard let url = URL(string: urlString) else {
            fatalError("Wrong URL")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error while getting weather data")
        }
        
        let weatherReponse = try JSONDecoder().decode(WeatherResponseObject.self, from: data)
        
        return weatherReponse.forecast
    }
}
