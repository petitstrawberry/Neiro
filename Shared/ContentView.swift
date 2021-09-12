//
//  ContentView.swift
//  Shared
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var discoverUPnP: DiscoverUPnP
    @State var selection: Int? = 0
    
    var body: some View {
        let view = {
            VStack {
                NavigationView {
                    NavigationMenuView()
                    // BrowserView()
                }
                Spacer()
                NowPlayingBarView()
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    #if os(macOS)
                    Button(action: toggleSidebar, label: {
                        Image(systemName: "sidebar.left")
                    })
                    #endif
                }
            }
        }
        #if os(iOS)
        if AppWindow.getSize() == .narrow {
            view()
                .navigationViewStyle(StackNavigationViewStyle())
        } else {
            view()
                .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
        #else
        view()
        #endif
    }

    func toggleSidebar() {
        #if os(macOS)
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DiscoverUPnP())
            .environmentObject(UserDataObject())
            .environmentObject(NowPlayingObject())
    }
}
