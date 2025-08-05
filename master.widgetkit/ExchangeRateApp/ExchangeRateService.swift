//
//  ExchangeRateService.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 04/08/25.
//

import Foundation

struct ExchangeRateService {
    func getCurrentRate(from: String, to: String, amount: Int) async throws -> ExchangeRate {
        let urlString = "https://api.exchangerate.host/convert?access_key=399085ce19083c26f86fb33340f705ea&from=\(from)&to=\(to)&amount=\(amount)"
        
        guard let url = URL(string: urlString) else {
            fatalError("Missign URL")
        }
        
        print(url)
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error while fetching data")
        }
        
        let rateResponse = try JSONDecoder().decode(ExchangeRate.self, from: data)
        
        return rateResponse
    }
}
