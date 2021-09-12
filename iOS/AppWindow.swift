//
//  AppWindow.swift
//  Neiro (iOS)
//
//  Created by いちご on 2021/09/05.
//

import SwiftUI
import UIKit
import DeviceKit

class AppWindow: NSObject {
    
    static func getSize() -> AppWindowSize {
        let device = Device.current
        let orientation = UIDevice.current.orientation
        let screenSize = UIScreen.main.bounds.size
        let windowSize = UIApplication.shared.delegate?.window?!.bounds.size
        
        if orientation == .portrait {
            if device.isPhone {
                return .narrow
            } else {
                if screenSize.width == windowSize?.width {
                    return .wide
                } else {
                    return .narrow
                }
            }
        } else {
            if device.isPhone {
                dump(device)
                if Device.allPlusSizedDevices.contains(device) || Device.allSimulatorPlusSizedDevices.contains(device) {
                    print("Plus")
                    return .wide
                }
                return .narrow
            } else {
                if let size = windowSize {
                    if screenSize.width == size.width {
                        return .wide
                    } else {
                        if device.description.contains("12.9-inch") {
                            if screenSize.width/2 == windowSize?.width {
                                return .wide
                            }
                        }
                        return .narrow
                    }
                }
                return .wide
            }
        }
    }
}

enum AppWindowSize {
    case wide
    case narrow
}
