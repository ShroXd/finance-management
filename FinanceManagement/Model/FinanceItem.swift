//
//  FinanceItem.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/24.
//

import Foundation
import CoreData

enum Payment: String {
    case bank = "Bank"
    case alipay = "Alipay"
    case wechat = "Wechat"
}

class FinanceItem: NSManagedObject {
    @NSManaged public var id: UUID
    @NSManaged public var title: String
    @NSManaged public var money: Double
    @NSManaged public var time: String
    @NSManaged public var paymentStr: String
}

extension FinanceItem: Identifiable {
    var payment: Payment {
        get { return Payment(rawValue: paymentStr) ?? .bank }
        set { self.paymentStr = newValue.rawValue }
    }
}
