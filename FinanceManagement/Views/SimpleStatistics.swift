//
//  SimpleStatistics.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/18.
//

import SwiftUI

struct SimpleStatistics: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("$30.40")
                    .font(.system(.title2, design: .rounded))
                Text("Pay")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(Color(.systemGray))
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("$30.40")
                    .font(.system(.title2, design: .rounded))
                Text("Income")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(Color(.systemGray))
            }
        }
    }
}

struct SimpleStatistics_Previews: PreviewProvider {
    static var previews: some View {
        SimpleStatistics()
    }
}
