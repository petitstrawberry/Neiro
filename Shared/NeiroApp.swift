//
//  NeiroApp.swift
//  Shared
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI

@main
struct NeiroApp: App {
    @State var stateManager = StateManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DiscoverUPnP())
                .environmentObject(UserDataObject())
                .environmentObject(NowPlayingObject())
                .environmentObject(stateManager)
        }
    }
}
