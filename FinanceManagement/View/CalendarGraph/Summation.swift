//
//  Summation.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/22.
//

import SwiftUI

struct Summation: View {
    var lable: String
    var money: Double
    var color: CustomColor
    var currency: String = "$"
    
    private var formattedMoney: StringPair {
        return money.splitAtDecimal()
    }
    
    private var valueOfColor: String {
        return color.rawValue
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(lable)
                .font(.system(.footnote, design: .rounded))
                .foregroundColor(Color(.systemGray))
            
            HStack(alignment: .firstTextBaseline, spacing: 2) {
                Text(currency)
                    .font(.system(.title3, design: .rounded))
                    .foregroundColor(Color(.systemGray3))
                Text(formattedMoney.0)
                    .font(.system(size: 32, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(valueOfColor))
                Text(".\(formattedMoney.1)")
                    .font(.system(.title3, design: .rounded))
                    .foregroundColor(Color(.systemGray))
                
            }
        }
    }
}

struct Summation_Previews: PreviewProvider {
    static var previews: some View {
        Summation(lable: "Expense", money: 300.80, color: .red)
    }
}
