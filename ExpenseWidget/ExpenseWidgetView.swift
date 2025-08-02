//
//  ExpenseWidgetView.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 02/08/25.
//

import SwiftUI

struct ExpenseWidgetView: View {
    
    let category: ExpenseCategory
    
    var body: some View {
        switch category {
        case .all:
            ExpenseItemView(label: "Total Expense", amount: 5300, budget: 6000, color: .blue)
        case .food:
            ExpenseItemView(label: "Food Expense", amount: 600, budget: 800, color: .orange)
        case .grocery:
            ExpenseItemView(label: "Grocery Expense", amount: 1200, budget: 1400, color: .indigo)
        case .gas:
            ExpenseItemView(label: "Gas Expense", amount: 800, budget: 1100, color: .purple)
        case .rent:
            ExpenseItemView(label: "Rent Expense", amount: 2700, budget: 2700, color: .mint)
        }
    }
}
