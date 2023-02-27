//
//  PaymentEditViewModel.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/27.
//

import Foundation
import Combine

class PaymentEditViewModel: ObservableObject {
    
    @Published var inputText = "0.00"
    
    private var cancellables = Set<AnyCancellable>()
    
    func numberButtonTapped(_ number: String) {
        inputText += number
    }
    
    func clearButtonTapped() {
        inputText = ""
    }
    
    func deleteButtonTapped() {
        if !inputText.isEmpty {
            inputText.removeLast()
        }
    }
}
