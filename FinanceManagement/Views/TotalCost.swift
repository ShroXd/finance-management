//
//  TotalCost.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/16.
//

import SwiftUI

struct TotalCost: View {
    var body: some View {
        VStack {
            Text("Spent this week")
                .font(.system(.title3, design: .rounded))
                .foregroundColor(Color("secondGray"))
            
            HStack(alignment: .lastTextBaseline) {
                Text("¥")
                    .font(.system(size: 35, design: .rounded))
                    .baselineOffset(20)
                    .foregroundColor(Color("secondGray"))
                Text("300")
                    .font(.system(size: 65, design: .rounded))
                Text(".23")
                    .font(.system(size: 35, design: .rounded))
                    .baselineOffset(20)
            }
        }
    }
}

struct TotalCost_Previews: PreviewProvider {
    static var previews: some View {
        TotalCost()
    }
}
