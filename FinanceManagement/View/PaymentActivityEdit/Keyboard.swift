//
//  Keyboard.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/26.
//

import SwiftUI

// Shake clean up

struct Keyboard: View {
    
    @EnvironmentObject var viewModel: PaymentEditViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let numberOrder = ["7", "8", "9", "4", "5", "6", "1", "2", "3", "Done", "0", "Delete"]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(numberOrder, id: \.self) { number in
                switch number {
                case "Done":
                    KeyBuilder(size: (22, 18), action: {}) {
                        Text("Done").foregroundColor(Color("MainBlue"))
                    }
                case "Delete":
                    KeyBuilder(size: (22, 18), action: {}) {
                        Image(systemName: "delete.left")
                            .foregroundColor(Color(.systemGray3))
                            .frame(width: 62)
                    }
                default:
                    KeyBuilder(action: {}) {
                        Text("\(number)")
                    }
                }
            }
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
    }
}

private struct KeyBuilder<Content: View>: View {
    @State private var keyClicked = false
    
    let size: (CGFloat, CGFloat)
    let fn: () -> Void
    let content: Content
    
    init(size: (CGFloat, CGFloat) = (32, 24), action: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.size = size
        self.fn = action
        self.content = content()
    }
    
    var body: some View {
        Button(
            action: { fn(); keyEffect() },
            label: { content.font(.system(size: keyClicked ? size.0 : size.1)) }
        )
        .buttonStyle(KeyStyle())
    }
    
    private func keyEffect() {
        let impactMed = UIImpactFeedbackGenerator(style: .soft)
        impactMed.impactOccurred()
        
        withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
            self.keyClicked.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)) {
                self.keyClicked.toggle()
            }
        }
    }
    
    private struct KeyStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .foregroundColor(Color(.systemGray3))
                .frame(width: 62, height: 52)
        }
    }
}
