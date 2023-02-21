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
                .padding(.horizontal)
                
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Total spent this month")
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(Color(.systemGray))
                            
                            HStack(alignment: .firstTextBaseline, spacing: 3) {
                                Text("300")
                                    .font(.system(size: 52, design: .rounded))
                                    .fontWeight(.semibold)
                                Text(".80")
                                    .font(.system(.largeTitle, design: .rounded))
                                    .foregroundColor(Color(.systemGray))
                                Text("$")
                                    .font(.system(.largeTitle, design: .rounded))
                                    .foregroundColor(Color(.systemGray))
                                Spacer()
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    CashFlowGraph()
                }
                .padding(26)
                .background(.white)
                .clipShape(
                    RoundedRectangle(cornerRadius: 20)
                )
                .shadow(color: Color(.systemGray4), radius: 10, x: 0, y: 0)
                .padding()
                .padding(.bottom)
                
                PayList()
                    .padding(.horizontal)
                // TODO: ask load more?
            }
            
            Spacer()
        }
        .padding(.top, 62)
        .ignoresSafeArea()
    }
}
