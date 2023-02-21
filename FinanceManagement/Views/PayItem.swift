//
//  PayItem.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/16.
//

import SwiftUI

struct PayItem: View {
    
    @State var isPay = true
    
    @State var icon: String
    @State var name: String
    // TODO: implement a class to handle format
    @State var time: String
    // TODO: implement a class to handle currency
    @State var money: String
    @State var payment: String
    
    var body: some View {
        HStack {
            Text(icon)
                .font(.system(.title))
                .padding(.horizontal, 7)
            VStack(alignment: .leading, spacing: 3) {
                Text(name)
                    .font(.system(.headline))
                    .fontWeight(.semibold)
                Text(time)
                    .font(.system(.footnote))
                    .foregroundColor(Color(.systemGray))
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 3) {
                Text(money)
                    .font(.system(.headline))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(isPay ? "MainRed" : "MainBlue"))
                Text(payment)
                    .font(.system(.footnote))
                    .foregroundColor(Color(.systemGray))
            }
        }
        .padding(.vertical)
//        .background(Color(.systemGray6))
        .cornerRadius(20)
    }
}

struct PayItem_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PayItem(icon: "🐈", name: "cat", time: "4:24 PM", money: "$ 3.22", payment: "Alipay")
            PayItem(isPay: false, icon: "🐈", name: "cat", time: "23:00", money: "$ 3.22", payment: "Alipay")
        }
    }
}
