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
        entity: PaymentActivity.entity(),
        sortDescriptors: [ NSSortDescriptor(keyPath: \PaymentActivity.date, ascending: false) ])
    var paymentActivity: FetchedResults<PaymentActivity>
    
    private var paymentDataForView: [PaymentActivity] {
        return paymentActivity
            .sorted(by: { $0.date.compare($1.date) == .orderedAscending })
    }
    
    var body: some View {
        TabView {
            InboxView(paymentDataForView: paymentDataForView)
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
    @State var showEditView = false
    
    var paymentDataForView: [PaymentActivity]
    
    var body: some View {
        VStack(spacing: 24) {
            ScrollView(showsIndicators: false) {
                InboxHeader(showEditView: $showEditView)
                CalendarGraph()
                PayList(showEditView: $showEditView, paymentDataForView: paymentDataForView)
                    .padding(.horizontal, 22)
                    .padding(.bottom, 56)
                    .onTapGesture {
                        self.showEditView.toggle()
                        print("paymentDataForView: ", paymentDataForView)
                    }
                
                // TODO: ask load more?
            }
            
            Spacer()
        }
        .padding(.top, 62)
        .ignoresSafeArea()
        .sheet(isPresented: $showEditView) {
//            EditFinanceItemView(
//                showEditView: $showEditView,
//                title: currentFinanceItem?.title ?? "Title",
//                money: currentFinanceItem?.money ?? 23.32,
//                time: currentFinanceItem?.time ?? "Feb 2",
//                payment: currentFinanceItem?.payment ?? .bank
//            )
        }
    }
}
