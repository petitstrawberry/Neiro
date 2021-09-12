//
//  ContentView.swift
//  Neiro (iOS)
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI
import UIKit
import DeviceKit
import FlexibleSheet

struct ContentView: View {
    @EnvironmentObject var discoverUPnP: DiscoverUPnP
    @EnvironmentObject var stateManager: StateManager
    @State var selection: Int? = 0

    
    var body: some View {
        
        GeometryReader { geometry in
            let sheetStyle = BottomSheetStyle(
                // 最小の時の高さ
                minHeight: 60,
                // 最大の時の高さ
                maxHeight:
                    geometry.size.height,
                // 角丸にするとこ
                corners: [],
                cornerRadius: 0,
                // Sheetをドラッグした際のアニメーション
                animation: .interactiveSpring(response: 0.5, dampingFraction: 1.0, blendDuration: 1.0),
                // 背景にするView クロージャーで外に出して設定もできる
                background: Color.white
            )
            
            let view = {
                VStack(spacing: 0) {
                    NavigationView {
                        NavigationMenuView()
                        // BrowserView()
                    }
                    Spacer()
                }
                .bottomSheet(state: $stateManager.nowPlayingSheet, style: sheetStyle) {
                    NowPlayingMainView()
                }
                .animation(.none, value: geometry.size)
            }
            
            if AppWindow.getSize() == .narrow {
                view()
                    .navigationViewStyle(StackNavigationViewStyle())
            } else {
                view()
                    .navigationViewStyle(DoubleColumnNavigationViewStyle())
            }
        }
        .edgesIgnoringSafeArea([.top, .horizontal])
        .background(
            Color(UIColor.systemGray2).edgesIgnoringSafeArea(.all)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DiscoverUPnP())
            .environmentObject(UserDataObject())
            .environmentObject(NowPlayingObject())
            .environmentObject(StateManager())
    }
}
