//
//  Entity+Sunlight.swift
//  XR_AVP
//
//  Created by Young Li on 9/2/24.
//

import RealityKit

extension Entity {
    // Adds an image-based light that emulates sunlight.
    func setSunlight(intensity: Float?) {
        if let intensity {
            Task {
                guard let resource = try? await EnvironmentResource(named: "ImageBasedLight") else { return }
                print("setting sun light...")
                var iblComponent = ImageBasedLightComponent(
                    source: .single(resource),
                    intensityExponent: intensity)
                
                // Ensure that the light rotates with its entity.
                iblComponent.inheritsRotation = true
                
                components.set(iblComponent)
                components.set(ImageBasedLightReceiverComponent(imageBasedLight: self))
            }
        } else {
            components.remove(ImageBasedLightComponent.self)
            components.remove(ImageBasedLightReceiverComponent.self)
        }
    }
}

