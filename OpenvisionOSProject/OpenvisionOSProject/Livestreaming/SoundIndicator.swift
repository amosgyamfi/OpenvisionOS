//
//  SoundIndicator.swift
//  SwiftUIOpenVoipAnimations
//
//  Created by amos.gyamfi@getstream.io on 7.7.2023.
//

import SwiftUI

struct SoundIndicator: View {
    @State private var recording = 0.0
    @State private var isRecording = false
    let boulderBlue = Color(#colorLiteral(red: 0, green: 0.3725490196, blue: 1, alpha: 1))
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 1)
                .fill(.white.gradient)
                .frame(width: 64, height: 64)
                .scaleEffect(recording)
                .animation(.bouncy.repeatForever(autoreverses: true), value: recording)
            Circle()
                .stroke(lineWidth: 1)
                .fill(.white.gradient)
                .frame(width: 64, height: 64)
                .scaleEffect(recording)
                .animation(.easeInOut(duration: 0.5).delay(1).repeatForever(autoreverses: false), value: recording)
            Circle()
                .fill(.purple.gradient)
                .frame(width: 48, height: 48)
                .scaleEffect(recording)
                .animation(.bouncy.delay(0.5).repeatForever(autoreverses: false), value: recording)
            Circle()
                .fill(.white.gradient)
                .frame(width: 64, height: 64)
                .scaleEffect(isRecording ? 0.9 : 1.0)
                .animation(.bouncy.repeatForever(autoreverses: true), value: isRecording)
            Image(systemName: "mic.fill")
                .font(.largeTitle)
                .symbolRenderingMode(.multicolor)
        }
        .onAppear {
            recording = .random(in: 1..<2)
            isRecording.toggle()
        }
    }
}

#Preview {
    SoundIndicator()
}
