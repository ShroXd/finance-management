//
//  PayItem.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/16.
//

import SwiftUI

struct PayItem: View {
    var body: some View {
//        RoundedRectangle(cornerRadius: 20)
//            .fill(Color(.systemGray6))
//            .frame(height: 80)
        HStack {
            Text("🐈")
                .font(.system(.title))
                .padding(.horizontal, 7)
            VStack(alignment: .leading, spacing: 3) {
                Text("Pet")
                    .font(.system(.headline))
                    .fontWeight(.semibold)
                Text("4:24 PM")
                    .font(.system(.footnote))
                    .foregroundColor(Color(.systemGray))
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 3) {
                Text("$ 2.34")
                    .font(.system(.headline))
                    .fontWeight(.semibold)
                Text("Alipay")
                    .font(.system(.footnote))
                    .foregroundColor(Color(.systemGray))
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(20)
    }
}

struct PayItem_Previews: PreviewProvider {
    static var previews: some View {
        PayItem()
    }
}
