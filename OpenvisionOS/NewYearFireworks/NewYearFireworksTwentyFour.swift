//
//  NewYearFireworksTwentyFour.swift
//  OpenvisionOS
//
//  Created by Amos Gyamfi on 01.11.2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct NewYearFireworksTwentyFour: View {
    var body: some View {
        NavigationStack {
            VStack {
                Model3D(named: "newYear") { model in
                     model
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .scaleEffect(0.6)
                         .padding()
                 } placeholder: {
                     ProgressView()
                 }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    NewYearFireworksTwentyFour()
}
