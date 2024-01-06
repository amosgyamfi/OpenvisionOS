//
//  FlowerPotView.swift
//  OpenvisionOS
//
//  Created by Amos Gyamfi on 5.1.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FlowerPotView: View {
    
    var body: some View {
        ZStack {
            VStack {
                Model3D(named: "pointSparkle") { model in
                    model
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(0.2)
                        .offset(x: -66, y: 200)
                } placeholder: {
                    ProgressView()
                }
                
                Model3D(named: "Flower-Port") { model in
                    model
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
            }
            
            Model3D(named: "BgSparcle") { model in
                model
                    .resizable()
                    .scaledToFit()
                
            } placeholder: {
                ProgressView()
            }
        }
        .padding()
    }
}

#Preview {
    FlowerPotView()
}
