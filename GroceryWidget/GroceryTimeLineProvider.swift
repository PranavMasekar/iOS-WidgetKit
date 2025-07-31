//
//  GroceryTimeLineProvider.swift
//  DevWidgetsExtension
//
//  Created by Pranav Masekar on 31/07/25.
//

import SwiftUI
import WidgetKit

struct GroceryTimeLineProvider: TimelineProvider {
    
    typealias Entry = GroceryEntry
    
    func placeholder(in context: Context) -> GroceryEntry {
        GroceryEntry()
    }
    
    func getSnapshot(in context: Context, completion: @escaping @Sendable (GroceryEntry) -> Void) {
        completion(GroceryEntry())
    }
    
    func getTimeline(in context: Context, completion: @escaping @Sendable (Timeline<GroceryEntry>) -> Void) {
        let request = Item.fetchRequest()
        
        request.fetchOffset = 0
        
        switch context.family {
        case .systemSmall:
            request.fetchLimit = 3
        case .systemMedium:
            request.fetchLimit = 4
        case .systemLarge:
            request.fetchLimit = 9
        default:
            request.fetchLimit = 1
        }
        
        do {
            let items = try CoreDataManager.shared.managedObjectContext.fetch(request)
            
            completion(Timeline(entries: [GroceryEntry(items: items)], policy: .never))
        } catch {
            print(error.localizedDescription)
        }
    }
}
