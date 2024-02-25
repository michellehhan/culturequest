//
//  OrientationView.swift
//  wwdc
//
//  Created by Michelle Han on 2/24/24.
//

import Foundation

import SwiftUI

// Import UIKit only for iOS, not for macOS
#if canImport(UIKit)
import UIKit
#endif

struct OrientationView: View {
    // This environment property is useful for macOS and for additional layout decisions on iOS
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    // State for tracking orientation on iOS
    @State private var isLandscape: Bool = false

    var body: some View {
        Group {
            // Platform-specific checks
            #if os(iOS)
            // iOS-specific logic, including iPad
            if isLandscape {
                ContentView()
            } else {
                Text("This app is currently only designed to be played horizontally on an iPad. Please rotate your device to continue!")
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.system(size: 20))
                    .onAppear {
                        // Update orientation state based on UIKit's UIDevice
                        #if canImport(UIKit)
                        self.isLandscape = UIDevice.current.orientation.isLandscape
                        NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                            self.isLandscape = UIDevice.current.orientation.isLandscape
                        }
                        #endif
                    }
            }
            #elseif os(macOS)
            // For macOS, directly show ContentView as macOS doesn't have the concept of device orientation
            ContentView()
            #endif
        }
    }
}

// Ensure to include this for previews or any other SwiftUI view that might consume OrientationView
struct OrientationView_Previews: PreviewProvider {
    static var previews: some View {
        OrientationView()
    }
}
