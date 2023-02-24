//
//  EditExpenseView.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/22.
//

import SwiftUI

struct Expense {
    var name: String
    var amount: Double
    var date: Date
}

struct EditFinanceItemView: View {
    @Environment(\.managedObjectContext) var context
    
    @Binding var showEditView: Bool
    
    @State var title: String
    @State var money: Double
    @State var time: String
    @State var payment: Payment
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Add a new task")
                        .font(.system(.title, design: .rounded))
                        .bold()
                    
                    Spacer()
                    
                    Button(action: {
                        self.showEditView = false
                        
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.headline)
                    }
                }
                
                TextField("Enter the task description", text: $title)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.bottom)
                
//                Text("Priority")
//                    .font(.system(.subheadline, design: .rounded))
//                    .padding(.bottom)
//
//                HStack {
//                    Text("High")
//                        .font(.system(.headline, design: .rounded))
//                        .padding(10)
//                        .background(priority == .high ? Color.red : Color(.systemGray4))
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                        .onTapGesture {
//                            self.priority = .high
//                        }
//
//                    Text("Normal")
//                        .font(.system(.headline, design: .rounded))
//                        .padding(10)
//                        .background(priority == .normal ? Color.orange : Color(.systemGray4))
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                        .onTapGesture {
//                            self.priority = .normal
//                        }
//
//                    Text("Low")
//                        .font(.system(.headline, design: .rounded))
//                        .padding(10)
//                        .background(priority == .low ? Color.green : Color(.systemGray4))
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                        .onTapGesture {
//                            self.priority = .low
//                        }
//                }
//                .padding(.bottom, 30)
                
                // Save button for adding the todo item
                Button(action: {
                    
                    if self.title.trimmingCharacters(in: .whitespaces) == "" {
                        return
                    }

                    self.showEditView = false
                    
                    self.addFinanceItem(
                        title: "Cat",
                        money: 22.3,
                        time: "Feb 2",
                        payment: .bank
                    )
                    
                }) {
                    Text("Save")
                        .font(.system(.headline, design: .rounded))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.purple)
                        .cornerRadius(10)
                }
                .padding(.bottom)
                
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10, antialiased: true)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func addFinanceItem(title: String, money: Double, time: String, payment: Payment) {
        let financeItem = FinanceItem(context: context)
        
        financeItem.id = UUID()
        financeItem.title = title
        financeItem.money = money
        financeItem.time = time
        financeItem.payment = payment

        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

struct EditExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        EditFinanceItemView(showEditView: .constant(false), title: "Cat", money: 12.32, time: "Feb 2", payment: .bank)
    }
}
