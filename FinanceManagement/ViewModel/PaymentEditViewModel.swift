//
//  PaymentEditViewModel.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/27.
//

import Foundation
import Combine

class PaymentEditViewModel: ObservableObject {
    
    @Published var amount: String = "0.00"
    var amountNumber: Double = 0.00 {
        didSet {
            amount = String(String(format: "%.3f", amountNumber).dropLast())
        }
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    func numberButtonTapped(_ number: String) {
        amountNumber = amountNumber * 10 + (Double(number) ?? 0.00) / 100
    }
    
    func clearButtonTapped() {
        amount = "0.00"
        amountNumber = 0.00
    }
    
    func deleteButtonTapped() {
        // Int will round the result down to the nearest integer
        amountNumber = Double(Int(amountNumber * 100 / 10)) / 100
    }
}
