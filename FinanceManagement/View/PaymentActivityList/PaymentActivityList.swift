//
//  PaymentActivityList.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/16.
//

import SwiftUI

struct PaymentActivityList: View {
    @Binding var showEditView: Bool
    @Binding var selectedPayment: PaymentActivity?
    
    var paymentDataForView: [PaymentActivity]
    
    var body: some View {
        VStack(alignment: .leading) {
            SectionTitle(name: "Recent transactions")
                .padding(.bottom)
            
            HStack {
                Text("Today")
                    .foregroundColor(Color(.systemGray))
                    .font(.system(.body))
                Spacer()
                Text("$ 2.20")
                    .foregroundColor(Color(.systemGray))
                    .font(.system(.body))
                    .onTapGesture {
                        print("Log from pay list: ", paymentDataForView.first!)
                    }
            }
            ForEach(paymentDataForView) { activity in
                Row(paymentActivity: activity)
                    .onTapGesture {
                        showEditView.toggle()
                        selectedPayment = activity
                    }
            }
        }
    }
}

struct PayList_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        let testTrans = PaymentActivity(context: context)
        
        testTrans.paymentId = UUID()
        testTrans.name = "Cat"
        testTrans.date = Date()
        testTrans.amount = 12.34
        testTrans.type = .expense
        
        return PaymentActivityList(showEditView: .constant(false), selectedPayment: .constant(nil), paymentDataForView: [testTrans])
    }
}
