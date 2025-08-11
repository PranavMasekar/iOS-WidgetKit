//
//  PizzaType.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 11/08/25.
//

import Foundation

enum PizzaType: String, Identifiable, CaseIterable {
case cheese = "Cheese"
    case chicken = "Chicken"
    case hawaiian = "Hawaiian"
    case neapolitan = "Neapolitan"
    case chicago = "Chicago"
    case newYork = "New York"
    case sicilian = "Sicilian"
    case greek = "Greek"
    case california = "California"
    
    var id: UUID {
        return UUID()
    }
}
