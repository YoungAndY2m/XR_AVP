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
    @Published var selectedPortal: Portal?
    var portalVM: PortalViewModel
    
    // Initialize portalCount
    init(portalCount: Int) {
        self.portalVM = PortalViewModel(portalCount: portalCount)
    }
    
    // User interaction
    func handleUserInteraction(with portal: Portal) {
        isInteracting = true
        selectedPortal = portal
        selectedPortal?.expand()
    }
    
    func stopInteraction() {
        isInteracting = false
        selectedPortal = nil
    }
}

