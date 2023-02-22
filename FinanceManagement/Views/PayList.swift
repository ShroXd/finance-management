//
//  PayList.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/16.
//

import SwiftUI

struct PayList: View {
    @Binding var showEditView: Bool
    
    init(showEditView: Binding<Bool> = .constant(false)) {
        _showEditView = showEditView
    }
    
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
            }
            .padding(.top)
            
            // a thinking face
            PayItem(icon: "🐈", name: "cat", time: "4:24 PM", money: "$ 3.22", payment: "Alipay", showEditView: $showEditView)
            PayItem(icon: "🐈", name: "cat", time: "4:24 PM", money: "$ 3.22", payment: "Alipay", showEditView: $showEditView)
            PayItem(isPay: false, icon: "🐈", name: "cat", time: "4:24 PM", money: "$ 3.22", payment: "Alipay", showEditView: $showEditView)
            PayItem(icon: "🐈", name: "cat", time: "4:24 PM", money: "$ 3.22", payment: "Alipay", showEditView: $showEditView)
            PayItem(icon: "🐈", name: "cat", time: "4:24 PM", money: "$ 3.22", payment: "Alipay", showEditView: $showEditView)
        }
    }
}

struct PayList_Previews: PreviewProvider {
    static var previews: some View {
        PayList()
    }
}
