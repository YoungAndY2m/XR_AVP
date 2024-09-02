//
//  XR_AVPApp.swift
//  XR_AVP
//
//  Created by Young Li on 9/2/24.
//

import SwiftUI

@main
struct XR_AVPApp: App {
    @StateObject private var vm = InteractionViewModel()
    
    var body: some Scene {
        WindowGroup(id: "Home") {
            ContentView()
        }
        .windowStyle(.volumetric)
        .defaultSize(CGSize(width: 600, height: 450))
        
        WindowGroup(id: "Portal 1") {
            
        }
        
        WindowGroup(id: "Portal 2") {
            
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
