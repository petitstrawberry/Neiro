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
            List {
                NavigationLink(destination: BrowserView()) {
                    Text("Music Server 1")
                }
                NavigationLink(destination: BrowserView()) {
                    Text("Music Server 2")
                }
                NavigationLink(destination: BrowserView()) {
                    Text("Music Server 3")
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
