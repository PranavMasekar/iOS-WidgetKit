//
//  ExpenseTimeLineProvider.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 02/08/25.
//

import Foundation
import WidgetKit

struct ExpenseTimeLineProvider: IntentTimelineProvider {
    
    typealias Entry = ExpenseEntry
    
    typealias Intent = MonthlyExpenseIntent
    
    private func category(for config: MonthlyExpenseIntent) -> ExpenseCategory {
        switch config.category {
            
        case .unknown:
                .all
        case .all:
                .all
        case .food:
                .food
        case .grocery:
                .grocery
        case .gas:
                .gas
        case .rent:
                .rent
        }
    }
    
    func placeholder(in context: Context) -> ExpenseEntry {
        ExpenseEntry(category: .all)
    }
    
    func getSnapshot(for configuration: MonthlyExpenseIntent, in context: Context, completion: @escaping @Sendable (ExpenseEntry) -> Void) {
        completion(ExpenseEntry(category: .all))
    }
    
    func getTimeline(for configuration: MonthlyExpenseIntent, in context: Context, completion: @escaping @Sendable (Timeline<ExpenseEntry>) -> Void) {
        let entry = ExpenseEntry(category: category(for: configuration))
        
        completion(Timeline(entries: [entry], policy: .never))
    }
}
