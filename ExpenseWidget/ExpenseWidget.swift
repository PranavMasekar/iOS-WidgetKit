//
//  ExpenseWidget.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 02/08/25.
//

import SwiftUI
import WidgetKit

struct ExpenseWidget: Widget {
    var body: some WidgetConfiguration {
        IntentConfiguration(
            kind: "com.pranav.expenseWidget",
            intent: MonthlyExpenseIntent.self,
            provider: ExpenseTimeLineProvider()
        ) { entry in
            if #available(iOS 17.0, *) {
                ExpenseWidgetView(category: entry.category)
                    .containerBackground(.clear, for: .widget)
            } else {
                ExpenseWidgetView(category: entry.category)
                    .padding()
                    .background()
            }
        }
        .contentMarginsDisabled()
        .supportedFamilies([.systemSmall,])
        .configurationDisplayName("Expense Widget")
        .description("Widget to show configurable expense widget")
    }
}


#Preview(as: .systemSmall) {
    ExpenseWidget()
} timeline: {
    ExpenseEntry(category: .food)
}
