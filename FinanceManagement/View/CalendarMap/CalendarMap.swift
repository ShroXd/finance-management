//
//  CalendarMap.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/22.
//

import SwiftUI

struct CalendarMap: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Cash Flow")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.semibold)
                .padding(.bottom)
            HeatMap()
            HStack(spacing: 60) {
                Summation(lable: "Expense", money: 300.8, color: .red)
                Summation(lable: "Income", money: 100.08, color: .blue)
            }
                .padding(.top)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 32)
        .background(.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
        .shadow(color: Color(.systemGray4), radius: 10, x: 0, y: 0)
        .padding(.horizontal, 22)
        .padding(.bottom)
    }
}

struct CalendarGraph_Previews: PreviewProvider {
    static var previews: some View {
        CalendarMap()
    }
}
