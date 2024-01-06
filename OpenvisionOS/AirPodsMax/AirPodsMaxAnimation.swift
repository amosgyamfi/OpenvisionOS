//
//  AirPodsMaxAnimation.swift
//  OpenvisionOS
//
//  Created by Amos Gyamfi on 12.11.2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct AirPodsMaxAnimation: View {
    var body: some View {
        NavigationStack {
            VStack {
                Model3D(named: "Airpods_Max_Pink") { model in
                     model
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .scaleEffect(0.5)
                         .phaseAnimator([false, true]) { AirPodsMax, threeDYRotate in
                             AirPodsMax
                                 .rotation3DEffect(.degrees(threeDYRotate ? 0 : -360 * 5), axis: (x: 0, y: 1, z: 0))
                         } animation: { threeDYRotate in
                                 .linear(duration: 5).repeatForever(autoreverses: false)
                         }
                 } placeholder: {
                     ProgressView()
                 }
            }
            .navigationTitle("Amos' AirPods Max")
            .toolbar {
                ToolbarItem(placement: .bottomOrnament) {
                    HStack {
                        Image(systemName: "battery.75percent")
                            .symbolRenderingMode(.hierarchical)
                        Text("75 %")
                    }
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    AirPodsMaxAnimation()
}
