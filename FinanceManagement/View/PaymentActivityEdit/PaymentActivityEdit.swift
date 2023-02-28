//
//  PaymentActivityEdit.swift
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

struct PaymentActivityEdit: View {
    @Environment(\.managedObjectContext) var context
    
    @Binding var showEditView: Bool
    @State var selectedPayment: PaymentActivity?
    
    @StateObject private var paymentEditViewModel = PaymentEditViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .firstTextBaseline) {
                Text("$")
                    .font(.system(size: 52, design: .monospaced))
                Text(paymentEditViewModel.amount.split(separator: ".")[0])
                    .font(.system(size: 52, design: .monospaced))
                Text(".")
                    .font(.system(size: 32, design: .monospaced))
                    .padding(.horizontal, -12)
                    .foregroundColor(Color(.systemGray2))
                Text(paymentEditViewModel.amount.split(separator: ".")[1])
                    .font(.system(size: 32, design: .monospaced))
                    .foregroundColor(Color(.systemGray2))

            }
            .onShakeGesture {
                paymentEditViewModel.clearButtonTapped()
            }
            Spacer()
            Divider()
            Keyboard()
                .padding(.bottom, 42)
                .environmentObject(paymentEditViewModel)
        }
        .padding(.horizontal, 34)
    }
    
    private func addPaymentActivity() {
        let paymentActivity = PaymentActivity(context: context)
        
        paymentActivity.paymentId = UUID()
        paymentActivity.name = "Cat"
        paymentActivity.date = Date()
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
        PaymentActivityEdit(
            showEditView: .constant(false),
            selectedPayment: nil
        )
    }
}
