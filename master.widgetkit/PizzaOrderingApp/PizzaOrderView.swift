//
//  PizzaOrderView.swift
//  master.widgetkit
//
//  Created by Pranav Masekar on 11/08/25.
//

import SwiftUI
import ActivityKit

struct PizzaOrderView: View {
    
    @State private var currentID: String = ""
    @State private var pizzaType: PizzaType = .cheese
    @State private var quantity: Int = 1
    
    
    private func getActivity(from id: String) -> Activity<PizzaOrderAttributes>? {
        guard let activity = Activity.activities.first(
            where: { (activity: Activity<PizzaOrderAttributes>) in
                activity.id == currentID
            }
        ) else {
            return nil
        }
        
        return activity
    }
    
    private func placeOrder(orderString: String) {
        let pizzaOrderAttrs = PizzaOrderAttributes(
            orderNumber: Int.random(in: 1000..<8888),
            orderedItem: orderString
        )
        
        let state = PizzaOrderAttributes.ContentState(status: .received)
        
        let content = ActivityContent(state: state, staleDate: nil)
        
        do  {
            let activity = try Activity<PizzaOrderAttributes>.request(
                attributes: pizzaOrderAttrs,
                content: content,
                pushType: nil
            )
            
            currentID = activity.id
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func updateOrder(with status: OrderStatus) {
        guard let activity = getActivity(from: currentID) else {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if #available(iOS 16.2, *) {
                var updateState = activity.content.state
                updateState.status = status
                
                let content = ActivityContent(state: updateState, staleDate: nil)
                Task {
                    await activity.update(content)
                }
            } else {
                var updateState = activity.contentState
                updateState.status = status
                
                Task {
                    await activity.update(using: updateState)
                }
            }
        }
    }
    
    private func orderComplete() {
        guard let activity = getActivity(from: currentID) else {
            return
        }
        
        Task {
            if #available(iOS 16.2, *) {
                let content = ActivityContent(state: activity.content.state, staleDate: nil)
                await activity.end(content, dismissalPolicy: .immediate)
            } else {
                await activity.end(using: activity.contentState, dismissalPolicy: .immediate)
            }
            
            currentID = ""
        }
    }
    
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Form {
                    
                    Picker("Pizza Type", selection: $pizzaType) {
                        ForEach(PizzaType.allCases) { type in
                            Text(type.rawValue)
                                .tag(type)
                        }
                    }
                    
                    Stepper.init("Quantity", value: $quantity, in: 1...10)
                    
                    Section (header: Text("Summary")) {
                        Text("Order \(quantity) Large \(pizzaType.rawValue) Pizza(s)")
                        
                        HStack {
                            Spacer()
                            
                            Button("Place order") {
                                 placeOrder(
                                    orderString: "\(quantity) Large \(pizzaType.rawValue) Pizza(s)"
                                 )
                            }
                        }
                    }
                    
                    if !currentID.isEmpty {
                        Section (header: Text("Admin Section")) {
                            Button("Update order in progress") {
                                updateOrder(with: .inProgress)
                            }
                            .frame(width: 400)
                            
                            Button("Update order in oven") {
                                updateOrder(with: .inOven)
                            }
                            .frame(width: 400)
                            
                            Button("Update order is on the way") {
                                updateOrder(with: .onTheWay)
                            }
                            .frame(width: 400)
                            
                            Button("Complete order") {
                                orderComplete()
                            }
                            .frame(width: 400)
                        }
                    }
                    
                } //: Form
                
            } //: VStack
            .navigationTitle("Pizza Shop")
            
        } //: NavigationStack
    }
}

#Preview {
    PizzaOrderView()
}
