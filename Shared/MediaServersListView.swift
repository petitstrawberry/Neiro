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
    @EnvironmentObject var userData: UserDataObject
    
    var body: some View {
        VStack {
            Button (action: discoverUPnP.scanUPnPDevices, label: {
                Text("Refresh")
            })
            List {
                Section(header: Text("Saved Servers")){
                    ForEach(userData.savedServers, id: \.self) { savedServer in
                        NavigationLink(
                            destination: EmptyView(),
                            label: {
                                VStack {
                                    Text(savedServer.url?.absoluteString ?? "")
                                        .lineLimit(1)
                                }
//                                .onAppear() {
//                                    let request = URLRequest(url: savedServer.url!)
//                                    let device = BasicUPnPDevice()
//                                    device.loadDescriptionFromXML()
//
//                                    let parser = BasicDeviceParser(uPnPDevice: device)
//
//                                    /// URLにアクセス
//                                    URLSession.shared.dataTask(with: request) { data, response, error in
//                                        if let data = data {
//                                            parser?.parse(from: data)
//                                            print(device.friendlyName)
//                                        }
//                                    }.resume()
//                                }
                            }
                        ).tag(savedServer)
                    }
                }
                Section(header: Text("Local Servers")){
                    ForEach(discoverUPnP.mediaServers, id: \.self) { mediaServer in
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
            }.listStyle(SidebarListStyle())
        }
    }
}

struct MediaServersListView_Previews: PreviewProvider {
    static var previews: some View {
        MediaServersListView()
            .environmentObject(DiscoverUPnP())
            .environmentObject(UserDataObject())
    }
}
