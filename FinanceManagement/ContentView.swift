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

struct StatisticsView: View {
    var body: some View {
        HStack(spacing: 60) {
            VStack(alignment: .leading) {
                Text("Expense")
                    .font(.system(.footnote, design: .rounded))
                    .foregroundColor(Color(.systemGray))
                
                HStack(alignment: .firstTextBaseline, spacing: 3) {
                    Text("$")
                        .font(.system(.title3, design: .rounded))
                        .foregroundColor(Color(.systemGray3))
                    Text("300")
                        .font(.system(size: 32, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("MainBlue"))
                    Text(".80")
                        .font(.system(.title3, design: .rounded))
                        .foregroundColor(Color(.systemGray))
                    
                }
            }
            
            VStack(alignment: .leading) {
                Text("Income")
                    .font(.system(.footnote, design: .rounded))
                    .foregroundColor(Color(.systemGray))
                
                HStack(alignment: .firstTextBaseline, spacing: 3) {
                    Text("$")
                        .font(.system(.title3, design: .rounded))
                        .foregroundColor(Color(.systemGray3))
                    Text("100")
                        .font(.system(size: 32, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("MainRed"))
                    Text(".80")
                        .font(.system(.title3, design: .rounded))
                        .foregroundColor(Color(.systemGray))
                    
                }
            }
        }
    }
}

struct InboxView: View {
    
    @State var isSimpleStatisticsShow = false
    
    var body: some View {
        VStack(spacing: 24) {
            
            //            RoundedRectangle(cornerRadius: 18)
            //                .frame(width: .infinity, height: 80)
            //                .foregroundColor(Color(.systemGray5))
            //                .padding(.horizontal)
            

            
            ScrollView(showsIndicators: false) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Hi, Atri!")
                            .font(.system(size: 42, design: .rounded))
                            .fontWeight(.semibold)
                        Text("Total spent this month")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(Color(.systemGray))
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 22)
                .padding(.bottom, 44)
                
                VStack(alignment: .leading) {
                    Text("Cash Flow")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    CashFlowGraph()
                    StatisticsView()
                        .padding(.top)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 32)
                .background(.white)
                .clipShape(
                    RoundedRectangle(cornerRadius: 20)
                )
                .shadow(color: Color(.systemGray4), radius: 10, x: 0, y: 0)
                .padding(.horizontal, 22)
                .padding(.bottom)
                
                PayList()
                    .padding(.horizontal, 22)
                    .padding(.bottom, 56)
                // TODO: ask load more?
            }
            
            Spacer()
        }
        .padding(.top, 62)
        .ignoresSafeArea()
    }
}

