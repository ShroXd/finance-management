//
//  PaymentActivityList.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/16.
//

import SwiftUI

struct PaymentActivityList: View {
    @Binding var showEditView: Bool
    @Binding var selectedPayment: PaymentActivity?
    
    var paymentDataForView: [PaymentActivity]
    
    var body: some View {
        VStack(alignment: .leading) {
            SectionTitle(name: "Recent transactions")
            
            //            HStack {
            //                Text("Today")
            //                    .foregroundColor(Color(.systemGray))
            //                    .font(.system(.body))
            //                Spacer()
            //                Text("$ 2.20")
            //                    .foregroundColor(Color(.systemGray))
            //                    .font(.system(.body))
            //                    .onTapGesture {
            //                        print("Log from pay list: ", paymentDataForView.first!)
            //                    }
            //            }
            
            
            List {
                ForEach(paymentDataForView, id: \.paymentId) { activity in
                    NavigatableRow(showEditView: $showEditView, selectedPayment: $selectedPayment, activity: activity)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                .contextMenu {
                    Button(action: {
                        print("Delete!!")
                    }, label: {
                        VStack {
                            Text("Delete")
                            Image(systemName: "trash")
                        }
                    })
                }
            }
            .listStyle(.plain)
        }
    }
}

struct PayList_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        let testTrans = PaymentActivity(context: context)
        
        testTrans.paymentId = UUID()
        testTrans.name = "Cat"
        testTrans.date = Date()
        testTrans.amount = 12.34
        testTrans.type = .expense
        
        return PaymentActivityList(showEditView: .constant(false), selectedPayment: .constant(nil), paymentDataForView: [testTrans])
    }
}

struct NavigatableRow: View {
    @Binding var showEditView: Bool
    @Binding var selectedPayment: PaymentActivity?
    @ObservedObject var activity: PaymentActivity
    
    var body: some View {
        ZStack {
            NavigationLink(
                destination: PaymentActivityEdit(
                    showEditView: $showEditView,
                    selectedPayment: selectedPayment
                ).toolbar(.hidden, for: .tabBar)) {
                    EmptyView()
                }
                .opacity(0.0)
                .buttonStyle(PlainButtonStyle())
            
            Row(paymentActivity: activity)
        }
    }
}
