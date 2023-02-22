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

struct EditExpenseView: View {
       @Binding var expense: Expense
       @Environment(\.presentationMode) var presentationMode
       
       var body: some View {
           Form {
               Section(header: Text("Expense Details")) {
                   TextField("Name", text: $expense.name)
                   TextField("Amount", value: $expense.amount, formatter: NumberFormatter())
                   DatePicker("Date", selection: $expense.date, displayedComponents: .date)
               }
               Section {
                   Button("Save") {
                       // Save the changes and dismiss the view
                       self.presentationMode.wrappedValue.dismiss()
                   }
               }
           }
           .navigationTitle("Edit Expense")
       }
}

struct EditExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        let expense = Expense(name: "Groceries", amount: 50.0, date: Date())
        
        EditExpenseView(expense: Binding.constant(expense))
    }
}
