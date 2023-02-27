//
//  PaymentEditViewModel.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/27.
//

import Foundation
import Combine

class PaymentEditViewModel: ObservableObject {
    
    @Published var amount = ""
    
    var amountArray: [Int]? = [] {
        didSet {
            if let intArray = amountArray {
                for (index, element) in intArray.enumerated() {
                    if index == 1 {
                        amount += "\(element)."
                    } else {
                        amount += "\(element)"
                    }
                }
            }
        }
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    func numberButtonTapped(_ number: String) {
        if amountArray == nil {
            amountArray = [Int(number)!]
        } else {
            amountArray!.append(Int(number)!)
        }
    }
    
    func clearButtonTapped() {
//        amount = ""
    }
    
    func deleteButtonTapped() {
//        if !amount.isEmpty {
//            amount.removeLast()
//        }
    }
}
