//
//  Button.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/26.
//

import Foundation
import SwiftUI

extension Button {
    func withTapGestureEffect(keyClicked: Binding<Bool>) -> some View {
        self.onTapGesture {
            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
            
            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
                keyClicked.wrappedValue.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
                    keyClicked.wrappedValue.toggle()
                }
            }
        }
    }
}
