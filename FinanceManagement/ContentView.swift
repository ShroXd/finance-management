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
        VStack {
            
//            Group {
//                if isSimpleStatisticsShow {
//                    SimpleStatistics()
//                } else {
//                    TotalCost()
//                }
//            }
//            .padding(.top, 45)
//            .onTapGesture {
//                isSimpleStatisticsShow.toggle()
//            }
            
            CashFlowGraph()
                .padding(.top, 65)
                .padding(.bottom, 45)
            
            ScrollView {
                PayList()
                
                // TODO: ask load more?
            }
        }
    }
}
