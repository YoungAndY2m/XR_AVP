//
//  XR_AVPApp.swift
//  XR_AVP
//
//  Created by Young Li on 9/2/24.
//

import SwiftUI

@main
struct XR_AVPApp: App {
    // MARK: fixed portal count
    @StateObject private var vm = InteractionViewModel(portalCount: 2)
    
    var body: some Scene {
        WindowGroup(id: "Home") {
            ContentView()
        }
        .windowStyle(.volumetric)
        .defaultSize(CGSize(width: 600, height: 450))
        
        WindowGroup(id: "Portal 1") {
            PortalView(portal: vm.portalVM.portals[0], color: Color.blue)
                .environmentObject(vm)
        }
        
        WindowGroup(id: "Portal 2") {
            PortalView(portal: vm.portalVM.portals[1], color: Color.orange)
                .environmentObject(vm)
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
