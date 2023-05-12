    //
    //  AGView.swift
    //  Animations
    //
    //  Created by Carolane LEFEBVRE on 09/05/2023.
    //

import SwiftUI

struct AGView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                //.onEnded { _ in dragAmount = .zero }
                    .onEnded { _ in
                        withAnimation(.spring()) { // Explicit animation
                            dragAmount = .zero
                        }
                    }
            )
            // .animation(.spring(), value: dragAmount) Implicit animation
    }
}

struct AGView2: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

struct AGView_Previews: PreviewProvider {
    static var previews: some View {
        AGView2()
    }
}
