//
//  LiveConcertVideo.swift
//  SwiftUIOpenVoipAnimations
//
//  Created by amos.gyamfi@getstream.io on 8.7.2023.
//

import SwiftUI
import AVKit

struct LiveConcertVideo: View {
    @State var player = AVPlayer()
    let avPlayer = AVPlayer(url: Bundle.main.url(forResource: "concert", withExtension: "mp4")!)
    
    var body: some View {
        
        ZStack {
            VideoPlayer(player: avPlayer)
                .scaleEffect(1.25)
                .mask(UnevenRoundedRectangle(
                    topLeadingRadius: 32,
                    bottomLeadingRadius: 4,
                    bottomTrailingRadius: 32,
                    topTrailingRadius: 4)
                      //.stroke(style: StrokeStyle(lineWidth: 2))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
                )
                .onAppear {
                    avPlayer.play()
                    avPlayer.actionAtItemEnd = .none
                    NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem, queue: .main) { (_) in
                        avPlayer.seek(to: .zero)
                        avPlayer.play()
                    }
                }
        }
        
    }
}

#Preview {
    LiveConcertVideo()
}
