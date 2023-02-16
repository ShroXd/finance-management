//
//  PayList.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/16.
//

import SwiftUI

struct PayList: View {
    var body: some View {
        VStack {
            HStack {
                Text("Today")
                    .foregroundColor(Color("SecondGray"))
                    .font(.system(.body))
                Spacer()
                Text("$ 2.20")
                    .foregroundColor(Color("SecondGray"))
                    .font(.system(.body))
            }
            Divider()
            
            PayItem()
            PayItem()
            PayItem()
            PayItem()
            PayItem()
        }
        .padding()
    }
}

struct PayList_Previews: PreviewProvider {
    static var previews: some View {
        PayList()
    }
}
