//
//  SimpleStatistics.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/18.
//

import SwiftUI

struct SimpleStatistics: View {
    var body: some View {
        HStack(spacing: 42) {
            VStack(alignment: .leading) {
                Text("Pay")
                    .font(.system(.title2, design: .rounded))
                    .foregroundColor(Color("SecondGray"))
                Text("$30.40")
                    .font(.system(size: 40, design: .rounded))
            }
            
            VStack(alignment: .leading) {
                Text("Income")
                    .font(.system(.title2, design: .rounded))
                    .foregroundColor(Color("SecondGray"))
                Text("$30.40")
                    .font(.system(size: 40, design: .rounded))
            }
        }
    }
}

struct SimpleStatistics_Previews: PreviewProvider {
    static var previews: some View {
        SimpleStatistics()
    }
}
