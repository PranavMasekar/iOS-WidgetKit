//
//  ExpenseCategory.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 02/08/25.
//

import Foundation

enum ExpenseCategory : Int {
    case all = 1
    case food
    case grocery
    case gas
    case rent
    
    var description: String {
        switch self {
            
        case .all:
            return "All Expenses"
        case .food:
            return "Food Expenses"
        case .grocery:
            return "Grocery Expenses"
        case .gas:
            return "Gas Expenses"
        case .rent:
            return "Rent Expenses"
        }
    }
}
