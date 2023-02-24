//
//  ContentView.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/16.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        entity: FinanceItem.entity(),
        sortDescriptors: [])
    var financeItems: FetchedResults<FinanceItem>
    
    var body: some View {
        TabView {
            InboxView(currentFinanceItem: nil, financeItems: financeItems)
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
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct InboxView: View {
    @State var expense = Expense(name: "Groceries", amount: 50.0, date: Date())
    @State var showEditView = false
    @State var currentFinanceItem: Optional<FinanceItem>
    
    var financeItems: FetchedResults<FinanceItem>
    
    var body: some View {
        VStack(spacing: 24) {
            ScrollView(showsIndicators: false) {
                InboxHeader(showEditView: $showEditView)
                CalendarGraph()
                PayList(showEditView: $showEditView, financeItems: financeItems)
                    .padding(.horizontal, 22)
                    .padding(.bottom, 56)
                    .onTapGesture {
                        self.showEditView.toggle()
                        self.currentFinanceItem = financeItems[0]
                        print("accountItems: ", financeItems)
                    }
                
                // TODO: ask load more?
            }
            
            Spacer()
        }
        .padding(.top, 62)
        .ignoresSafeArea()
        .sheet(isPresented: $showEditView) {
            EditFinanceItemView(
                showEditView: $showEditView,
                title: currentFinanceItem?.title ?? "Title",
                money: currentFinanceItem?.money ?? 23.32,
                time: currentFinanceItem?.time ?? "Feb 2",
                payment: currentFinanceItem?.payment ?? .bank
            )
        }
    }
}
