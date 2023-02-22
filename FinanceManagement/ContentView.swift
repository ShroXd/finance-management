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
    @State var expense = Expense(name: "Groceries", amount: 50.0, date: Date())
    @State var showEditView = false
    
    var body: some View {
        VStack(spacing: 24) {
            ScrollView(showsIndicators: false) {
                InboxHeader()
                CalendarGraph()
                PayList(showEditView: $showEditView)
                    .padding(.horizontal, 22)
                    .padding(.bottom, 56)
                    .onTapGesture {
                        self.showEditView.toggle()
                    }
                
                // TODO: ask load more?
            }
            
            Spacer()
        }
        .padding(.top, 62)
        .ignoresSafeArea()
        .sheet(isPresented: $showEditView) {
            EditExpenseView(expense: self.$expense)
        }
    }
}

