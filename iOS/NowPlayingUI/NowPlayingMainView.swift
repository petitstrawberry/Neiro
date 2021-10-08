//
//  NowPlayingMainView.swift
//  Neiro
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI
import FlexibleSheet

struct NowPlayingMainView: View {
    @EnvironmentObject var stateManager: StateManager
    
    var body: some View {
        ZStack {
            VStack {
                NowPlayingBarView()
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(Color(UIColor.systemGray))
                    .onTapGesture {
                        stateManager.nowPlayingSheet = .max
                    }
                Spacer()
            }
            .opacity(stateManager.nowPlayingSheet == .min ? 1.0 : 0)
            
            VStack{
                Spacer()
                Image(systemName: "music.note.house")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300, maxHeight: 300)
                HStack {
                    VStack {
                        Text("Title")
                            .font(.title)
                        Text("Artist")
                            .font(.title2)
                            .opacity(0.8)
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical)
                VStack(spacing: 0) {
                    SliderView()
                    HStack {
                        Text("0:00")
                            .opacity(0.8)
                        Spacer()
                        Text("3:02")
                            .opacity(0.8)
                    }
                    .padding(.top, 8)
                }
                .padding(.horizontal, 20)
                .padding(.vertical)
                HStack() {
                    Button (action: {}){
                        Image(systemName: "backward.end.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 30.0)
                    }
                    Spacer()
                    Button (action: {}){
                        Image(systemName: "play.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 40)
                    }
                    Spacer()
                    Button (action: {}){
                        Image(systemName: "forward.end.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 30.0)
                    }
                }
                .frame(maxWidth: 250)
                .padding(.horizontal, 20)
                .padding(.vertical)
                Spacer()
            }
        }
        .foregroundColor(.white)
        .background(Color(UIColor.systemGray2))
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct NowPlayingMainView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingMainView()
            .environmentObject(NowPlayingObject())
            .environmentObject(StateManager())
    }
}
