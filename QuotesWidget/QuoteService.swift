//
//  QuoteService.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 24/07/25.
//

import Foundation

struct QuoteService {
    func getQuote() async throws -> Quote {
        let urlString = "https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en"
        
        guard let url = URL(string: urlString) else {
            fatalError("Missing URL")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard(response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error while fetching data")
        }
        
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        
        return quote
    }
}
