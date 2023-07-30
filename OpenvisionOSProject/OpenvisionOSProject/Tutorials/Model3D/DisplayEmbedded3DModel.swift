//
//  DisplayEmbedded3DModel.swift
//  OpenvisionOSProject
//
//  Created by Amos Gyamfi on 30.7.2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct DisplayEmbedded3DModel: View {
    var body: some View {
        NavigationStack {
            VStack {
                Model3D(named: "Nike_Pegasus") { nikePegasus  in
                   nikePegasus
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.15)
                        .phaseAnimator([false, true]) { nikePegasus, rotateXY in
                            nikePegasus
                                .rotation3DEffect(.degrees(rotateXY ? 720 : 0), axis: (x: 5, y: 5, z: rotateXY ? -15 : 15))
                        } animation: { rotateXY in
                            .easeInOut(duration: 8).repeatForever(autoreverses: false)
                        }
                } placeholder: {
                    ProgressView()
                }
            }
            .toolbar{
                ToolbarItemGroup(placement: .bottomOrnament) {
                    Image(systemName: "arrow.up.backward.and.arrow.down.forward.circle.fill")
                        .symbolRenderingMode(.hierarchical)
                        .font(.largeTitle)
                        .padding()
                    
                    Image(systemName: "square.and.arrow.up.circle.fill")
                        .symbolRenderingMode(.hierarchical)
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    VStack {
                        Text("Pegasus 33")
                            .font(.largeTitle)
                        Text("Air Zoom Running Shoe")
                            .foregroundStyle(.secondary)
                    }
                    .padding(.horizontal, 64)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Buy")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    DisplayEmbedded3DModel()
}
