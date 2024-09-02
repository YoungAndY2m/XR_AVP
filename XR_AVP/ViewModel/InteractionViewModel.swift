//
//  InteractionViewModel.swift
//  XR_AVP
//
//  Created by Young Li on 9/2/24.
//

import SwiftUI
import Combine

class InteractionViewModel: ObservableObject {
    @Published var isInteracting: Bool = false
    var portalVM: PortalViewModel = PortalViewModel()
    
    // User interaction
    func handleUserInteraction() {
        isInteracting = true
        self.portalVM.expandPortal()
    }
    
    func stopInteraction() {
        isInteracting = false
    }
}

