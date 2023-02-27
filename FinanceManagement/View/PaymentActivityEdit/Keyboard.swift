//
//  Keyboard.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/26.
//

import SwiftUI

struct Keyboard: View {
    
    @EnvironmentObject var viewModel: PaymentEditViewModel
    
    var body: some View {
        VStack {
            KeyRow(first: "7", second: "8", third: "9")
            KeyRow(first: "4", second: "5", third: "6")
            KeyRow(first: "1", second: "2", third: "3")
            
            HStack {
                Key(size: (22, 18), action: {}) { Text("Done").foregroundColor(Color("MainBlue")) }
                Spacer()
                Key(action: { viewModel.numberButtonTapped("1") }) { Text("0") }
                Spacer()
                Key(size: (22, 18), action: {}) {
                    Image(systemName: "delete.left")
                        .foregroundColor(Color(.systemGray3))
                        .frame(width: 62)
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
    @Binding var keyClicked: Bool
    
    let size: (CGFloat, CGFloat)
    let fn: () -> Void
    let content: Content
    
    init(keyClicked: Binding<Bool>, size: (CGFloat, CGFloat), action: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self._keyClicked = keyClicked
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

private struct Key<Content: View>: View {
    @State private var keyClicked = false
    
    let size: (CGFloat, CGFloat)
    let action: () -> Void
    let content: Content
    
    init(size: (CGFloat, CGFloat) = (32, 24), action: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.size = size
        self.action = action
        self.content = content()
    }
    
    var body: some View {
        KeyBuilder(
            keyClicked: $keyClicked,
            size: size,
            action: action
        ) { content }
    }
}

private struct KeyRow: View {
    var first: String
    var second: String
    var third: String
    
    var body: some View {
        HStack {
            Key(action: keyAction) { Text(first) }
            Spacer()
            Key(action: keyAction) { Text(second) }
            Spacer()
            Key(action: keyAction) { Text(third) }
        }
    }
    
    private func keyAction() {
        print(Date())
    }
}
