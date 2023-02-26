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
        sortDescriptors: [ NSSortDescriptor(keyPath: \PaymentActivity.date, ascending: false)]
    ) var paymentActivity: FetchedResults<PaymentActivity>
    
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
    @State var selectedPayment: PaymentActivity?
    
    var paymentDataForView: [PaymentActivity]
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 32) {
                    InboxHeader(showEditView: $showEditView)
                    CalendarMap()
                    PaymentActivityList(
                        showEditView: $showEditView,
                        selectedPayment: $selectedPayment,
                        paymentDataForView: paymentDataForView
                    )
                    .padding(.bottom, 56)
                    // TODO: ask load more?
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 22)
        .padding(.top, 62)
        .ignoresSafeArea()
        .sheet(isPresented: $showEditView) {
            PaymentActivityEdit(
                showEditView: $showEditView,
                selectedPayment: selectedPayment
            )
        }
    }
}
