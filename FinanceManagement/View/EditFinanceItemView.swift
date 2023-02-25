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
                
//                TextField("Enter the task description")
//                    .padding()
//                    .background(Color(.systemGray6))
//                    .cornerRadius(8)
//                    .padding(.bottom)
                
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
                    self.showEditView = false
                    self.addPaymentActivity()
                    
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
    
    private func addPaymentActivity() {
        let paymentActivity = PaymentActivity(context: context)
        
        paymentActivity.paymentId = UUID()
        paymentActivity.name = "Cat"
        paymentActivity.date = "Feb 2"
        paymentActivity.amount = 23.44
        paymentActivity.type = .expense
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

struct EditExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        EditFinanceItemView(showEditView: .constant(false))
    }
}
