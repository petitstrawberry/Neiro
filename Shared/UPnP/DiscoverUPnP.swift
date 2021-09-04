//
//  DiscoverUPnP.swift
//  Neiro
//
//  Created by いちご on 2021/08/29.
//

import Foundation
import CocoaUPnP

class DiscoverUPnP: NSObject, ObservableObject, UPPDiscoveryDelegate {
    @Published var upnpDevices : [UPPBasicDevice] = []
    @Published var mediaServers: [UPPMediaServerDevice] = []

    override init() {
        super.init()
        self.scanUPnPDevices()
    }

    // UPnPデバイスのスキャンを要求
    func scanUPnPDevices() {
        print(#function)
        upnpDevices.removeAll()
        mediaServers.removeAll()
        UPPDiscovery.sharedInstance().addBrowserObserver(self)
        UPPDiscovery.sharedInstance().startBrowsing(forServices: "ssdp:all")
    }

    // UPPDiscoveryDelegate
    func discovery(_ discovery: UPPDiscovery, didFind device: UPPBasicDevice) {
        print(#function)
        if upnpDevices.contains(device) {
            return
        }
        upnpDevices.append(device)
        if device.deviceType == "urn:schemas-upnp-org:device:MediaServer:1" {
            mediaServers.append(device as! UPPMediaServerDevice)
        }
    }
}
