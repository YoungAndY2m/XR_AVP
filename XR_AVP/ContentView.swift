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
    
    // RealityView related
    @State private var enlarge = false
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    
    // ImmersiveView related
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        VStack {
            //            RealityView { content in
            //                // Add the initial RealityKit content
            //                if let scene = try? await Entity(named: "Scene", in: realityKitContentBundle) {
            //                    content.add(scene)
            //                }
            //            } update: { content in
            //                // Update the RealityKit content when SwiftUI state changes
            //                if let scene = content.entities.first {
            //                    let uniformScale: Float = enlarge ? 1.4 : 1.0
            //                    scene.transform.scale = [uniformScale, uniformScale, uniformScale]
            //                }
            //            }
            //            .gesture(TapGesture().targetedToAnyEntity().onEnded { _ in
            //                enlarge.toggle()
            //            })
            VStack (spacing: 20) {
                Image(systemName: "visionpro")
                    .font(.system(size: 100))
                    .symbolEffect(.pulse)
                    .bold()
                
                Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                    .font(.title)
                
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
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
}
