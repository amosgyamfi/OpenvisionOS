//
//  ControlBarView.swift
//  OpenvisionOSProject
//
//  Created by Amos Gyamfi on 23.7.2023.
//

import SwiftUI

struct ControlBarView: View {
    var body: some View {
        HStack {
            Button {
                //
            } label: {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                        .rotationEffect(.degrees(90))
                    Text("Leave Quietly")
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
            Image(systemName: "person.crop.rectangle.badge.plus")
                .font(.system(size: 48))
            
            Button {
                //
            } label: {
                Image(systemName: "hand.raised.fill")
                    .font(.title)
                    .foregroundStyle(.white)
                    .phaseAnimator([false, true]) { content, handRaise in
                        content
                            .offset(y: handRaise ? 0 : -100)
                            .rotation3DEffect(
                                .degrees(handRaise ? 0 : -180),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                            .animation(.bouncy.delay(1), value: handRaise)
                    }
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding(.bottom)
    }
}

#Preview {
    ControlBarView()
}
