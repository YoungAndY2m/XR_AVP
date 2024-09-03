//
//  ContentView.swift
//  XR_AVP
//
//  Created by Young Li on 9/2/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    // Window related
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    
    var body: some View {
        VStack {
            VStack (spacing: 20) {
                Image(systemName: "visionpro")
                    .font(.system(size: 100))
                    .symbolEffect(.pulse)
                    .bold()
                
                HStack {
                    Button("Portal 1") {
                        openWindow(id: "Portal 1")
                    }
                    
                    Button("Portal 2") {
                        openWindow(id: "Portal 2")
                    }
                }
            }
            .frame(width: 360)
            .padding(36)
            .glassBackgroundEffect()
            
        }
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
}
