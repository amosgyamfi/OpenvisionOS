//
//  HeartReactionView.swift
//  VoiceDorm
//
//  Created by amos.gyamfi@getstream.io on 21.7.2023.
//

import SwiftUI

struct HeartReactionView: View {
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white.gradient.opacity(0.9))
                .frame(width: 62, height: 62)
            ZStack{
                Image("heartOuter")
                    .phaseAnimator([false, true]) { heartIcon, pulsing in
                        heartIcon
                            .scaleEffect(pulsing ? 0.5 : 1, anchor: .bottom)
                            .animation(.bouncy.delay(0.05), value: pulsing)
                    }
                Image("heartMiddle")
                    .offset(y: 3)
                    .phaseAnimator([false, true]) { heartIcon, pulsing in
                        heartIcon
                            .scaleEffect(pulsing ? 0.5 : 1, anchor: .bottom)
                            .animation(.bouncy.delay(0.1), value: pulsing)
                    }
                Image("heartInner")
                    .offset(y: 6)
                    .phaseAnimator([false, true]) { heartIcon, pulsing in
                        heartIcon
                            .scaleEffect(pulsing ? 0.5 : 1, anchor: .bottom)
                    }
            }
            .offset(y: 4)
        }
    }
}

#Preview {
    HeartReactionView()
        .preferredColorScheme(.dark)
}
