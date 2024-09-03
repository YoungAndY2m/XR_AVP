//
//  ImmersiveView.swift
//  XR_AVP
//
//  Created by Young Li on 9/2/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        VStack (spacing: 12) {
            RealityView { content in
                // Add the initial RealityKit content
                if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                    content.add(immersiveContentEntity)
                    
                    immersiveContentEntity.setSunlight(intensity: 10.0)
                    
                    // Add an ImageBasedLight for the immersive content
                    guard let resource = try? await EnvironmentResource(named: "ImageBasedLight") else { return }
                    let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 0.25)
                    immersiveContentEntity.components.set(iblComponent)
                    immersiveContentEntity.components.set(ImageBasedLightReceiverComponent(imageBasedLight: immersiveContentEntity))
                }
            }
            
            Button("Exit Immersive Space") {
                Task {
                    await dismissImmersiveSpace()
                    openWindow(id: "Home")
                }
            }
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .foregroundColor(.white)
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
