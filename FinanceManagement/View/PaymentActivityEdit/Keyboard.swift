//
//  Keyboard.swift
//  FinanceManagement
//
//  Created by atriiy on 2023/2/26.
//

import SwiftUI

struct Keyboard: View {
    var body: some View {
        VStack {
            KeyRow(first: "7", second: "8", third: "9")
            KeyRow(first: "4", second: "5", third: "6")
            KeyRow(first: "1", second: "2", third: "3")
            
            HStack {
                Image(systemName: "delete.left")
                    .font(.system(size: 22))
                    .foregroundColor(Color(.systemGray3))
                    .frame(width: 62)
                Spacer()
                Key(name: "0")
                Spacer()
                Text("Done")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color(.systemGray3))
                    .frame(width: 64)
            }
        }
    }
}

struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard()
    }
}

private struct KeyStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color(.systemGray3))
            .frame(width: 62, height: 52)
    }
}

private struct KeyBuilder<Content: View>: View {
    let content: Content
    let fn: () -> Void
    
    @Binding var keyClicked: Bool
    
    init(action: @escaping () -> Void, @ViewBuilder content: () -> Content, keyClicked: Binding<Bool>) {
        self.fn = action
        self.content = content()
        self._keyClicked = keyClicked
    }
    
    var body: some View {
        Button(action: {
            fn()
            keyEffect()
        }, label: { content })
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
}

private struct Key: View {
    @State private var keyClicked = false
    
    var name: String
    
    var body: some View {
        KeyBuilder(
            action: keyAction,
            content: { Text(name).font(.system(size: keyClicked ? 32 : 24)) },
            keyClicked: $keyClicked
        )
    }
    
    private func keyAction() {
        print(Date())
    }
}

private struct KeyRow: View {
    var first: String
    var second: String
    var third: String
    
    var body: some View {
        HStack {
            Key(name: first)
            Spacer()
            Key(name: second)
            Spacer()
            Key(name: third)
        }
    }
}
