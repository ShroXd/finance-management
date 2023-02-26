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
    
    @State var testShake: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .center) {
                Text("$")
                    .font(.system(size: 28, design: .monospaced))
                    .foregroundColor(Color(.systemGray3))
                Text(testShake ? "950.00" : "0.00")
                    .font(.system(size: 52, design: .monospaced))
            }
            .onShakeGesture {
                self.testShake.toggle()
            }
            Spacer()
            Divider()
            Keyboard()
                .padding(.bottom, 42)
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
