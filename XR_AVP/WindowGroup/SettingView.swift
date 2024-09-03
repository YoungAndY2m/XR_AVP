//
//  SettingView.swift
//  XR_AVP
//
//  Created by Young Li on 9/3/24.
//

import SwiftUI

struct SettingView: View {
    
    @State private var showImmersiveSpace = true
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        VStack (spacing: 12) {
            Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                .font(.title)
        }
        .frame(width: 360)
        .padding(36)
        .glassBackgroundEffect()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if !newValue {
                    dismissWindow(id: "Settings")
                    openWindow(id: "Home")
                    await dismissImmersiveSpace()
                }
            }
        }
    }
}

#Preview {
    SettingView()
}
