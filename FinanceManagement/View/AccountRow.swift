//
//  PayItem.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/16.
//

import SwiftUI

struct AccountRow: View {
    
    @ObservedObject var financeItem: FinanceItem
    
    @Binding var showEditView: Bool
    
    var body: some View {
        HStack {
            Text("🐈")
                .font(.system(.title))
                .padding(.horizontal, 7)
            VStack(alignment: .leading, spacing: 3) {
//                Text(accountItem.title)
//                    .font(.system(.headline))
//                    .fontWeight(.semibold)
//                Text(accountItem.time)
//                    .font(.system(.footnote))
//                    .foregroundColor(Color(.systemGray))
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 3) {
                Text("34.23")
                    .font(.system(.headline))
                    .fontWeight(.semibold)
//                    .foregroundColor(Color(false ? "MainRed" : "MainBlue"))
//                Text(accountItem.payment.rawValue)
//                    .font(.system(.footnote))
//                    .foregroundColor(Color(.systemGray))
            }
        }
        .padding(.vertical)
        .cornerRadius(20)
        .onTapGesture {
            showEditView.toggle()
        }
    }
}

//struct PayItem_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
////            AccountRow(icon: "🐈", name: "cat", time: "4:24 PM", money: "$ 3.22", payment: "Alipay", showEditView: .constant(false))
////            AccountRow(accountItem: AccountItem(title: "Cat", money: 3.22, time: "Feb 2", payment: .alipay, isPay: false), showEditView: .constant(false))
////            AccountRow(accountItem: AccountItem(title: "Food", money: 1.22, time: "Feb 2", payment: .alipay, isPay: true), showEditView: .constant(false))
//        }
//    }
//}
