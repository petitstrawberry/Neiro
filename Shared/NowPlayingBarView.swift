//
//  NowPlayingBarView.swift
//  Neiro
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI

struct NowPlayingBarView: View {
    var body: some View {
        HStack {
            Image(systemName: "music.note.house")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 30, maxHeight: 30)
                .padding()
            Text("NowPlaying Footer")
                .padding()
            Spacer()
        }
    }
}

struct NowPlayingBar_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingBarView()
    }
}
