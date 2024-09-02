//
//  PortalViewModel.swift
//  XR_AVP
//
//  Created by Young Li on 9/2/24.
//

import SwiftUI
import Combine

class PortalViewModel: ObservableObject {
    // Portal attributes
    @Published var portalScale: CGFloat = 1.0
    @Published var isPortalFullyOpened: Bool = false
    @Published var isTransitioningToVR: Bool = false
    
    // Portal scale changing
    func expandPortal() {
        withAnimation {
            if portalScale < 3.0 { // TODO: boundary: 3.0
                portalScale += 0.5
            } else {
                isPortalFullyOpened = true
            }
        }
    }
    
    // Reset
    func resetPortal() {
        portalScale = 1.0
        isPortalFullyOpened = false
        isTransitioningToVR = false
    }
    
    // AR -> VR
    func triggerVRTransition() {
        if isPortalFullyOpened {
            isTransitioningToVR = true
        }
    }
}

