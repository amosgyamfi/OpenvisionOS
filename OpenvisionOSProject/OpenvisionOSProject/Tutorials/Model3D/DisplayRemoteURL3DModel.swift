//
//  DisplayRemoteURL3DModel.swift
//  OpenvisionOSProject
//
//  Created by Amos Gyamfi on 30.7.2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct DisplayRemoteURL3DModel: View {
    let remoteURL = URL(string: "about:blank")!
    
    var body: some View {
        VStack {
            Model3D(url: remoteURL) { model in
                model
                    .resizable()
                    .scaleEffect(0.25)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150)
        }
    }
}

#Preview {
    DisplayRemoteURL3DModel()
}
