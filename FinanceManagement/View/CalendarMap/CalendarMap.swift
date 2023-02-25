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
            SectionTitle(name: "Cash Flow")
                .padding(.bottom)
            HeatMap()
            HStack(spacing: 60) {
                Summation(lable: "Expense", money: 300.8, color: .red)
                Summation(lable: "Income", money: 100.08, color: .blue)
            }
            .padding(.top)
        }
    }
}

struct CalendarGraph_Previews: PreviewProvider {
    static var previews: some View {
        CalendarMap()
    }
}
