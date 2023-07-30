//
//  ContentView.swift
//  WindowStart
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    var body: some View {
        NavigationSplitView {
            List {
                Text("Item")
                Text("Item")
            }
            .navigationTitle("Sidebar")
        } detail: {
            VStack {
                Model3D(named: "visionPro") { model in
                    model
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(0.25)
                        .phaseAnimator([false, true]) { content, phase in
                            content
                                .rotation3DEffect(.degrees(phase ? 720 : 0), axis: (x: 4, y: 5, z: 0))
                        } animation: { phase in
                            .easeInOut(duration: 8).repeatForever(autoreverses: false)
                        }
                } placeholder: {
                    ProgressView()
                }
                
                Text("Vision Pro")
                    .font(.largeTitle)
            }
            .navigationTitle("Content")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
