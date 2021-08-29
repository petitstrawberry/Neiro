//
//  NowPlayingMainView.swift
//  Neiro
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI

struct NowPlayingMainView: View {
    var body: some View {
        VStack{
            Image(systemName: "music.note.house")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 300)
            Text("Title")
            Text("Artist")
        }
        
    }
}

struct NowPlayingMainView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingMainView()
    }
}
