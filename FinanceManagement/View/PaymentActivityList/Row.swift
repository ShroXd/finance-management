//
//  Row.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/16.
//

import SwiftUI

struct Row: View {
    
    @ObservedObject var paymentActivity: PaymentActivity
    
    @Binding var showEditView: Bool
    
    var body: some View {
        HStack {
            Text("🐈")
                .font(.system(.title))
                .padding(.horizontal, 7)
            VStack(alignment: .leading) {
                Text(paymentActivity.name)
                    .font(.system(.body))
                Text(paymentActivity.date.getFormattedDate(format: "MMM"))
                    .font(.system(.footnote))
                    .foregroundColor(Color(.systemGray2))
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 3) {
                Text("34.23")
                    .font(.system(.title3))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(paymentActivity.type == .expense ? "MainRed" : "MainBlue"))
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
        testTrans.date = Date()
        testTrans.amount = 12.34
        testTrans.type = .expense
        
        return Group {
            Row(paymentActivity: testTrans, showEditView: .constant(false))
        }
    }
}
