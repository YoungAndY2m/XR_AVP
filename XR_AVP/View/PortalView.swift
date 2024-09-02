//
//  PortalView.swift
//  XR_AVP
//
//  Created by Young Li on 9/2/24.
//

import SwiftUI

struct PortalView: View {
    @EnvironmentObject var vm: InteractionViewModel
    
    var body: some View {
        ZStack {
            // Portal Visual
            Color.black.opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            
            // Expand while interacting
            Circle()
                .strokeBorder(Color.blue, lineWidth: 5)
                .frame(width: 200 * vm.portalVM.portalScale, height: 200 * vm.portalVM.portalScale)
                .shadow(color: .purple, radius: 10)
                .overlay(
                    Circle()
                        .fill(Color.purple.opacity(0.3))
                )
                .animation(.easeInOut, value: vm.portalVM.portalScale)
                .onTapGesture {
                    vm.handleUserInteraction()
                }
            
            // TODO: alert while portal is fully opened
            if vm.portalVM.isPortalFullyOpened {
                Text("Portal Fully Opened")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .onAppear {
            vm.portalVM.resetPortal()
        }
    }
}


#Preview {
    return PortalView()
        .environmentObject(InteractionViewModel())
}
