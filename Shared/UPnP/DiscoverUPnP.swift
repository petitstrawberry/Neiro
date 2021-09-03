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
    
    
    
    func scanUPnPDevices() {
        print(#function)
//        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
        
        upnpDevices.removeAll()
        mediaServers.removeAll()
        UPPDiscovery.sharedInstance().addBrowserObserver(self)
        UPPDiscovery.sharedInstance().startBrowsing(forServices: "ssdp:all")
    }
    
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
