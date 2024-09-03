//
//  PortalView.swift
//  XR_AVP
//
//  Created by Young Li on 9/2/24.
//

import SwiftUI
import Combine

struct PortalView: View {
    
    @ObservedObject var portal: Portal
    var color: Color
    
    @State private var showImmersiveSpace = false
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @Environment(\.dismissWindow) var dismissWindow
    
    var body: some View {
        ZStack {
            // Portal Visual
            Color.black.opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            
            // Expand while interacting
            Circle()
                .strokeBorder(color, lineWidth: 5)
                .frame(width: 200 * portal.portalScale, height: 200 * portal.portalScale)
                .shadow(color: color, radius: 10)
                .overlay(
                    Circle()
                        .fill(color.opacity(0.3))
                )
                .animation(.easeInOut, value: portal.portalScale)
                .onTapGesture {
                    portal.expand()
                    if portal.isPortalFullyOpened {
                        showImmersiveSpace = true
                    }
                }
        }
        .onAppear {
            portal.reset()
        }
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    await openImmersiveSpace(id: "ImmersiveSpace")
                    dismissWindow(id: "Home")
                    dismissWindow(id: "Portal 1")
                    dismissWindow(id: "Portal 2")
                }
            }
        }
    }
}

#Preview {
    let portal = Portal()
    return PortalView(portal: portal, color: .blue)
}
