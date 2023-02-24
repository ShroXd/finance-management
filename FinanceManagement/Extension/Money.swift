//
//  Money.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/22.
//

import Foundation

typealias StringPair = (String, String)

extension Double {
    func splitAtDecimal() -> StringPair {
        let arr = String(format: "%.2f",self).split(separator: ".").map() { String($0) }
        return (arr[0], arr[1])
    }
}
