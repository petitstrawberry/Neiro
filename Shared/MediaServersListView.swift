//
//  MediaServersListView.swift
//  Neiro
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI
import upnpx

struct MediaServersListView: View {
    var mediaServer: MediaServer1Device? = MediaServer1Device.init()
    @EnvironmentObject var discoverUPnP: DiscoverUPnP
    
    var body: some View {
        VStack {
            Button (action: discoverUPnP.scanUPnPDevices, label: {
                Text("Refresh")
            })
            List(discoverUPnP.mediaServers, id: \.self) { mediaServer in
                let browserView = BrowserView(mediaServer: mediaServer)
                NavigationLink(
                    destination: browserView
                        .navigationTitle(mediaServer.friendlyName ?? ""),
                    label: {
                        Text(mediaServer.friendlyName)
                    }
                ).tag(mediaServer)
                
            }
        }
        
    }
}

struct MediaServersListView_Previews: PreviewProvider {
    static var previews: some View {
        MediaServersListView()
            .environmentObject(DiscoverUPnP())
    }
}
