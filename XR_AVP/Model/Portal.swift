//
//  Portal.swift
//  XR_AVP
//
//  Created by Young Li on 9/2/24.
//

import SwiftUI
import Combine

class Portal: ObservableObject, Identifiable {
    let id = UUID()
    @Published var portalScale: CGFloat = 1.0
    @Published var isPortalFullyOpened: Bool = false
    @Published var isFavorite: Bool = false
    
    func expand() {
        withAnimation {
            if portalScale < 3.0 { // TODO: boundary = 3
                portalScale += 0.8
            } else {
                isPortalFullyOpened = true
            }
        }
    }
    
    func reset() {
        portalScale = 1.0
        isPortalFullyOpened = false
    }
    
    func toggleFavorite() {
        isFavorite.toggle()
    }
}

