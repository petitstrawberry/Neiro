//
//  NavigationMenuView.swift
//  Neiro
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI

struct NavigationMenuView: View {
    var body: some View {
        VStack {
            MediaServersListView()
                .navigationTitle("Media Servers")
        }
    }
}

struct NavigationMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMenuView()
            .environmentObject(DiscoverUPnP())
    }
}
