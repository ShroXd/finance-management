//
//  SectionTitle.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/25.
//

import SwiftUI

struct SectionTitle: View {
    
    var name: String
    
    var body: some View {
        Text(name)
            .font(.system(.title2, design: .rounded))
            .fontWeight(.semibold)
    }
}

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle(name: "Cash Flow")
    }
}
