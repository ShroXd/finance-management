//
//  PayList.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/16.
//

import SwiftUI

struct PayList: View {
    @Binding var showEditView: Bool
    
    var paymentDataForView: [PaymentActivity]
    
    var body: some View {
        VStack {
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
            .padding(.top)
            
            ForEach(paymentDataForView) { element in
                AccountRow(paymentItem: element, showEditView: .constant(false))
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
        testTrans.date = "Feb 2"
        testTrans.amount = 12.34
        testTrans.type = .expense
        
        return PayList(showEditView: .constant(false), paymentDataForView: [testTrans])
    }
}
