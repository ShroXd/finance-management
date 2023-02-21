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

