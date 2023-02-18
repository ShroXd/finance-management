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
            
            Group {
                if isSimpleStatisticsShow {
                    SimpleStatistics()
                } else {
                    TotalCost()
                }
            }
            .padding(.top, 45)
            .onTapGesture {
                isSimpleStatisticsShow.toggle()
                
                let calendar = Calendar.current
                let date = Date()

                // Calculate start and end of the current year (or month with `.month`):
                let interval = calendar.dateInterval(of: .month, for: date)! //change year it will no of days in a year , change it to month it will give no of days in a current month

                // Compute difference in days:
                let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
                
                print(days)
            }
            
            
            ScrollView {
                PayList()
                
                // TODO: ask load more?
            }
        }
    }
}
