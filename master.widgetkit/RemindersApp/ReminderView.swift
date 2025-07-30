//
//  ReminderView.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 30/07/25.
//

import SwiftUI

struct ReminderView: View {
    
    @State private var reminders = [Reminder]()
    @State private var newReminder = ""
    
    @AppStorage(
        RemindersConstants.storageKey,
        store: UserDefaults(suiteName: RemindersConstants.appGroupName)
    ) private var reminderStorage: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                List(reminders) { reminder in
                    VStack (alignment: .leading) {
                        Text(reminder.title)
                            .font(.title)
                        
                        Text("Due on: " + reminder.dueOn.formatted(date: .abbreviated, time: .omitted))
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
                
                Spacer()
                
                TextField("Add new reminder", text: $newReminder)
                    .onSubmit {
                        if !newReminder.isEmpty {
                            let reminder = Reminder(title: newReminder, dueOn: Date())
                            
                            reminders.append(reminder)
                            
                            newReminder = ""
                            
                            reminderStorage = reminders.count
                            
                            RemindersConstants.reloadRemindersTimeline()
                        }
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding()
            } //: VStack
            .navigationTitle("Reminders")
        } //: NavigationStack
    }
}

#Preview {
    ReminderView()
}
