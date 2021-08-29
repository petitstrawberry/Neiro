//
//  BrowserView.swift
//  Neiro
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI
import upnpx

struct BrowserView: View {
    var mediaServer: BasicUPnPDevice? = BasicUPnPDevice.init()
    @EnvironmentObject var discoverUPnP: DiscoverUPnP
    
    var body: some View {
        
        List {
            NavigationLink(destination: self) {
                Text("Albums")
            }
            NavigationLink(destination: self) {
                Text("Artists")
            }
            NavigationLink(destination: self) {
                Text("Genre")
            }
        }
        .navigationTitle(mediaServer?.friendlyName ?? "Not Selected")
    }
}

struct BrowserView_Previews: PreviewProvider {
    static var previews: some View {
        BrowserView()
    }
}
