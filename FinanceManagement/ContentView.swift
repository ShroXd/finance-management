//
//  ContentView.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            InboxView()
                .tabItem {
                    Image(systemName: "tray.fill")
                }
            
            Text("Statistics Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                }
            
            Text("Profile Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "gearshape.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InboxView: View {
    
    @State var isSimpleStatisticsShow = false
    
    var body: some View {
        VStack(spacing: 24) {
            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        Text("$300.80")
                            .font(.system(size: 42, design: .rounded))
                            .fontWeight(.semibold)
                        Text("Total spent this month")
                            .font(.system(.callout, design: .rounded))
                            .foregroundColor(Color(.systemGray))
                    }
                    
                    Spacer()
                }
                .padding(.top, 45)
                .padding(.bottom, 12)
                
                CashFlowGraph()
                    .padding(.bottom, 24)
                
                PayList()
                // TODO: ask load more?
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}
