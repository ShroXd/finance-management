//
//  InboxHeader.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/22.
//

import SwiftUI

struct InboxHeader: View {
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color(.systemGray4))
                    .frame(width: 45, height: 45)
                
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            
            Spacer()
            VStack {
                Text("$30.40")
                    .font(.system(.title2, design: .rounded))
                Text("Net Value")
                    .font(.system(.footnote, design: .rounded))
                    .foregroundColor(Color(.systemGray))
            }
            Spacer()
            
            ZStack {
                Circle()
                    .fill(Color("MainBlue"))
                    .frame(width: 45, height: 45)
                
                Image(systemName: "plus")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 22)
        .padding(.bottom, 24)
        .padding(.top, 12)
    }
}

struct InboxHeader_Previews: PreviewProvider {
    static var previews: some View {
        InboxHeader()
    }
}
