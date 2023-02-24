//
//  PayItem.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/16.
//

import SwiftUI

struct AccountRow: View {
    
    var paymentItem: PaymentActivity
    
    @Binding var showEditView: Bool
    
    var body: some View {
        HStack {
            Text("🐈")
                .font(.system(.title))
                .padding(.horizontal, 7)
            VStack(alignment: .leading, spacing: 3) {
                Text(paymentItem.name)
                    .font(.system(.headline))
                    .fontWeight(.semibold)
                Text(paymentItem.date)
                    .font(.system(.footnote))
                    .foregroundColor(Color(.systemGray))
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 3) {
                Text("34.23")
                    .font(.system(.headline))
                    .fontWeight(.semibold)
//                    .foregroundColor(Color(false ? "MainRed" : "MainBlue"))
                Text("Alipay")
                    .font(.system(.footnote))
                    .foregroundColor(Color(.systemGray))
            }
        }
        .padding(.vertical)
        .cornerRadius(20)
        .onTapGesture {
            showEditView.toggle()
        }
    }
}

struct AccountRow_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        let testTrans = PaymentActivity(context: context)
        
        testTrans.paymentId = UUID()
        testTrans.name = "Cat"
        testTrans.date = "Feb 2"
        testTrans.amount = 12.34
        testTrans.type = .expense
        
        return Group {
            AccountRow(paymentItem: testTrans, showEditView: .constant(false))
        }
    }
}
