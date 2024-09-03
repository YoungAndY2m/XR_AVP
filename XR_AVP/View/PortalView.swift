//
//  PortalView.swift
//  XR_AVP
//
//  Created by Young Li on 9/2/24.
//

import SwiftUI

struct PortalView: View {
    @ObservedObject var portal: Portal
    var color: Color
    
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
                }
            
            // AR -> VR
            if portal.isPortalFullyOpened {
                Text("Portal Fully Opened")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .onAppear {
            portal.reset()
        }
    }
}

#Preview {
    let portal = Portal()
    return PortalView(portal: portal, color: .blue)
}
