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
                
                // Add SkyBox entity
                guard let skyBoxEntity = createSkybox() else {
                    print("Error loading skybox entity")
                    return
                }
                content.add(skyBoxEntity)
            }
        }
    }
    
    private func createSkybox () -> Entity? {
        // Mesh
        let largeSphere = MeshResource.generateSphere(radius: 1000)
        
        // Material
        var skyBoxMaterial = UnlitMaterial()
        
        // Add texture
        do {
            let texture = try TextureResource.load(named: "StarryNight")
            skyBoxMaterial.color = .init(texture: .init(texture))
        } catch {
            print("Error loading texture: \(error)")
        }
        
        // SkyBox Entity
        let skyBoxEntity = Entity()
        skyBoxEntity.components.set(
            ModelComponent(
                mesh: largeSphere,
                materials: [skyBoxMaterial]
            )
        )
        
        // Map texture to inner surface
        skyBoxEntity.scale *= .init(x: -1, y: 1, z: 1)
        
        return skyBoxEntity
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
