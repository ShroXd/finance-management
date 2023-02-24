//
//  PayList.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/16.
//

import SwiftUI

struct PayList: View {
    @Binding var showEditView: Bool
    
    let financeItems: FetchedResults<FinanceItem>
    
    var body: some View {
        VStack {
            HStack {
                Text("Today")
                    .foregroundColor(Color(.systemGray))
                    .font(.system(.body))
                Spacer()
                Text("$ 2.20")
                    .foregroundColor(Color(.systemGray))
                    .font(.system(.body))
            }
            .padding(.top)
            
            List {
                ForEach(financeItems) { element in
                    AccountRow(financeItem: element, showEditView: .constant(false))
                }
            }
        }
    }
}

struct PayList_Previews: PreviewProvider {

    struct PayListContainer: View {
        @FetchRequest(sortDescriptors: [])
        private var financeItems: FetchedResults<FinanceItem>

        var body: some View {
            PayList(showEditView: .constant(false), financeItems: financeItems)
        }
    }

    static var previews: some View {
        PayListContainer()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
