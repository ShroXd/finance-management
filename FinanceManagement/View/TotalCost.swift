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
            Text("Spent this month")
                .font(.system(.title3, design: .rounded))
                .foregroundColor(Color("SecondGray"))
            
            HStack(alignment: .lastTextBaseline) {
                Text("¥")
                    .font(.system(.title3, design: .rounded))
                    .baselineOffset(24)
                    .foregroundColor(Color("SecondGray"))
                Text("300")
                    .font(.system(size: 60, design: .rounded))
                    .fontWeight(.semibold)
                Text(".23")
                    .font(.system(.title3, design: .rounded))
                    .baselineOffset(24)
            }
        }
    }
}

struct TotalCost_Previews: PreviewProvider {
    static var previews: some View {
        TotalCost()
    }
}
