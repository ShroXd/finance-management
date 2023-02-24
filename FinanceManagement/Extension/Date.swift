//
//  Date.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/20.
//

import Foundation

extension Date {
    func getDaysOfCurrentMonth() -> Int {
        let calendar = Calendar.current
        let interval = calendar.dateInterval(of: .month, for: Date())!

        return calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
    }
    
    func getFormattedDate(format: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        
        return dateFormat.string(from: self)
    }
    
    func getCurrentMonth() -> String {
        return Date().getFormattedDate(format: "MMM")
    }
    
    func getPreviousMonth() -> String {
        return Calendar.current.date(byAdding: .month, value: -1, to: Date())!.getFormattedDate(format: "MMM")
    }
    
    func getNextMonth() -> String {
        return Calendar.current.date(byAdding: .month, value: 1, to: Date())!.getFormattedDate(format: "MMM")
    }
}
