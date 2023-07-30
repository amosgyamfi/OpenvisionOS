//
//  HandAndSparklesView.swift
//  VoiceDorm
//
//  Created by amos.gyamfi@getstream.io on 21.7.2023.
//

import SwiftUI

struct HandAndSparklesView: View {
    @State private var animationValue = 0
    @State private var scale = false
    @State private var move = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.black.gradient)
                .frame(width: 62, height: 62)
            Image(systemName: "hands.and.sparkles.fill")
                .font(.title)
                .foregroundStyle(
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
                )
                .symbolEffect(
                    .bounce.up.byLayer,
                    options: .repeating.speed(0.8),
                    value: animationValue
                )
                .onAppear{
                    animationValue = 1
                }
        }
        .opacity(move ? 0 : 1)
        .scaleEffect(move ? 0 : 1)
        .animation(.easeInOut.delay(4), value: move)
        .scaleEffect(scale ? 1 : 0)
        .scaleEffect(move ? 0.4 : 1)
        .offset(x: move ? 24 : 0, y: move ? -24 : 0)
        .offset(x: -54, y: -22)
        .onAppear{
            withAnimation(.bouncy.delay(1)) {
                scale.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation(.bouncy) {
                    move.toggle()
                }
            }
        }
    }
}

#Preview {
    HandAndSparklesView()
        .preferredColorScheme(.dark)
}
