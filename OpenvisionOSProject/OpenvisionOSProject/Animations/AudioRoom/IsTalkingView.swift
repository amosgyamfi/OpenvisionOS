//
//  IsTalkingView.swift
//  OpenvisionOSProject
//
//
//  SoundIndicator.swift
//  SwiftUIOpenVoipAnimations
//

import SwiftUI

struct  IsTalkingView: View {
    @State private var recording = 0.0
    @State private var isRecording = false
    let boulderBlue = Color(#colorLiteral(red: 0, green: 0.3725490196, blue: 1, alpha: 1))
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 1)
                .fill(.green.gradient)
                .frame(width: 32, height: 32)
                .scaleEffect(recording)
                .animation(.bouncy.repeatForever(autoreverses: true), value: recording)
            Circle()
                .stroke(lineWidth: 1)
                .fill(LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 32, height: 32)
                .scaleEffect(recording)
                .animation(.easeInOut(duration: 0.5).delay(1).repeatForever(autoreverses: false), value: recording)
            Circle()
                .stroke(lineWidth: 1)
                .fill(.purple.gradient)
                .frame(width: 32, height: 32)
                .scaleEffect(recording)
                .animation(.bouncy.delay(0.5).repeatForever(autoreverses: false), value: recording)
        }
        .onAppear {
            recording = .random(in: 1..<2)
            isRecording.toggle()
        }
    }
}

#Preview {
    IsTalkingView()
}
