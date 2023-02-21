//
//  CashFlowGraph.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/19.
//

import SwiftUI

func getNumOfFullColumns() -> [Int] {
    let days = Date().getDaysOfCurrentMonth()
    
    var configuration = [Int](repeating: days <= 30 ? 5 : 6, count: 5)
    
    let digit = days % 10
    configuration.append(digit < 5 ? digit : (digit - 5))
    
    return configuration
}

// TODO: temporary function
func randomColor() -> String {
    let num = Int.random(in: 1...99)
    
    if num < 33 {
        return "MainRed"
    } else if num < 66 {
        return "MainBlue"
    } else {
        return "FirstGray"
    }
}

struct CashFlowGraph: View {
    var currentMonth: String = Date().getCurrentMonth()
    var nextMonth: String = Date().getNextMonth()
    
    var columns: [Int] = getNumOfFullColumns()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    ForEach((0 ..< columns.count - 1), id: \.self) { idx in
                        ColumnView(number: columns[idx], alignment: .leading)
                    }
                    
                    ColumnView(number: columns.last!, alignment: .trailing)
                }
                
                Text(currentMonth)
                    .font(.system(.callout, design: .rounded))
                    .foregroundColor(Color(.systemGray))
                    .padding(.leading, 4)
            }
        }
    }
}

struct CashFlowGraph_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowGraph()
    }
}

struct ColumnView: View {
    var number: Int
    var alignment: HorizontalAlignment
    
    var body: some View {
        VStack(alignment: alignment) {
            ForEach((0 ..< number), id: \.self) { _ in
                Rectangle()
                    .frame(width: 30, height: 30)
                    .cornerRadius(8)
                    .foregroundColor(Color(randomColor()))
            }
        }
    }
}
