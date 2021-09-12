//
//  ContentView.swift
//  Neiro (iOS)
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI
import FlexibleSheet

struct ContentView: View {
    @EnvironmentObject var discoverUPnP: DiscoverUPnP
    @State var selection: Int? = 0
    @State var sheetState: BottomSheetState = .min

    // Setting BottomSheetStyle
    // background以外は省略可能 省略した場合はデフォルト値になる
    let sheetStyle = BottomSheetStyle(
        // 最小の時の高さ
        minHeight: 80,
        // 最大の時の高さ
        maxHeight: 700,
        // 角丸にするとこ
        corners: .allCorners,
        cornerRadius: 20,
        // Sheetをドラッグした際のアニメーション
        animation: .interactiveSpring(response: 0.5, dampingFraction: 1.0, blendDuration: 1.0),
        // 背景にするView クロージャーで外に出して設定もできる
        background: Color.white
    )
    
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
            .bottomSheet(state: $sheetState, style: sheetStyle) {
                NowPlayingMainView()
            }
            .edgesIgnoringSafeArea(.all)
            
        }
        
        if AppWindow.getSize() == .narrow {
            view()
                .navigationViewStyle(StackNavigationViewStyle())
        } else {
            view()
                .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
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
