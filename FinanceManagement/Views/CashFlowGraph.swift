//
//  CashFlowGraph.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/19.
//

import SwiftUI

struct CashFlowGraph: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 45, height: 45)
                .cornerRadius(8)
                .foregroundColor(Color("MainBlue"))
            Rectangle()
                .frame(width: 45, height: 45)
                .cornerRadius(8)
                .foregroundColor(Color("MainRed"))
        }
    }
    
    private func days() {
        let calendar = Calendar.current
        let date = Date()

        // Calculate start and end of the current year (or month with `.month`):
        let interval = calendar.dateInterval(of: .month, for: date)! //change year it will no of days in a year , change it to month it will give no of days in a current month

        // Compute difference in days:
        let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
        
        print(days)
    }
}

struct CashFlowGraph_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowGraph()
    }
}
