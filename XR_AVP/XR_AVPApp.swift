//
//  XR_AVPApp.swift
//  XR_AVP
//
//  Created by Young Li on 9/2/24.
//

import SwiftUI

@main
struct XR_AVPApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
