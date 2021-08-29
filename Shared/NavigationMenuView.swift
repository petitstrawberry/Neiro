//
//  NavigationMenuView.swift
//  Neiro
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI

struct NavigationMenuView: View {
    @EnvironmentObject var discoverUPnP: DiscoverUPnP
    var body: some View {
        VStack {
            List {
                ForEach(0..<discoverUPnP.mediaServers.count, id: \.self) { index in
                    NavigationLink(
                        destination: BrowserView(mediaServer: discoverUPnP.mediaServers[index]),
                        label: {
                            Text(discoverUPnP.mediaServers[index].friendlyName)
                    })
                }
            }
            .listStyle(SidebarListStyle())
        }
    }
}

struct NavigationMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMenuView()
    }
}
