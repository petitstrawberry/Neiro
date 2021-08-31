//
//  DiscoverUPnP.swift
//  Neiro
//
//  Created by いちご on 2021/08/29.
//

import Foundation
import upnpx

class DiscoverUPnP: NSObject, ObservableObject, UPnPDBObserver {
    @Published var upnpDevices : [BasicUPnPDevice] = []
    @Published var mediaServers: [MediaServer1Device] = []
    var upnpdb: UPnPDB?
    
    override init() {
        super.init()
        self.searchDevices()
    }
    
    
    func searchDevices() {
        print(#function)
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
        
        upnpDevices.removeAll()
        upnpdb = UPnPManager.getInstance()?.db
        upnpdb?.add(self)
        UPnPManager.getInstance()?.ssdp.setUserAgentProduct("Neiro 1.0", andOS: version as? String)
        _ = UPnPManager.getInstance()?.ssdp.searchSSDP
        upnpDevices = upnpdb?.rootDevices as! [BasicUPnPDevice]
    }
    
    func uPnPDBWillUpdate(_ db: UPnPDB!) {
        print(#function)
    }
    func uPnPDBUpdated(_ db: UPnPDB!) {
        print(#function)
        if let devices = db.rootDevices as? [BasicUPnPDevice] {
            DispatchQueue.main.sync {
                upnpDevices = devices
                mediaServers = getMediaServers(devices: upnpDevices)
            }
        }
    }
    
    // MediaServerだけ返す
    func getMediaServers(devices: [BasicUPnPDevice]) -> [MediaServer1Device] {
        var servers: [MediaServer1Device] = []
        for device in devices {
            if device.urn == "urn:schemas-upnp-org:device:MediaServer:1" {
                servers.append(device as! MediaServer1Device)
            }
        }
        return servers
    }
}
