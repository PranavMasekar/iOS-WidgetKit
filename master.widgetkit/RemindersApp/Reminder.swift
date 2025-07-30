//
//  Reminder.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 30/07/25.
//

import Foundation

struct Reminder: Identifiable {
    let id = UUID()
    var title: String
    var dueOn: Date
}
