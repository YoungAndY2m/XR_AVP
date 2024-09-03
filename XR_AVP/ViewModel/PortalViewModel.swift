//
//  PortalViewModel.swift
//  XR_AVP
//
//  Created by Young Li on 9/2/24.
//

import SwiftUI
import Combine

class PortalViewModel: ObservableObject {
    @Published var portals: [Portal] = []
    @Published var favoritePortalList: [Portal] = []
    
    init(portalCount: Int) {
        for _ in 0..<portalCount {
            portals.append(Portal())
        }
    }
    
    // Personal updates
    func addFavoritePortal(_ portal: Portal) {
        if !favoritePortalList.contains(where: { $0.id == portal.id }) {
            favoritePortalList.append(portal)
        }
    }
    
    func removeFavoritePortal(_ portal: Portal) {
        favoritePortalList.removeAll { $0.id == portal.id }
    }
    
    func toggleFavoritePortal(_ portal: Portal) {
        portal.toggleFavorite()
        if portal.isFavorite {
            addFavoritePortal(portal)
        } else {
            removeFavoritePortal(portal)
        }
    }
    
    // All portals
    func resetAllPortals() {
        portals.forEach { $0.reset() }
    }
}

