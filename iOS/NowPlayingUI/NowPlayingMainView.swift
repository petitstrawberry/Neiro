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
            HStack {
                Button (action: {}){
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 40.0)
                }
                Spacer()
                Button (action: {}){
                    Image(systemName: "play.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 50)
                }
                Spacer()
                Button (action: {}){
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 40.0)
                }
            }
            .padding()
            Spacer()
        }
        .foregroundColor(.white)
        .padding()
        .background(Color.black.opacity(0.8))
        .edgesIgnoringSafeArea(.all)
    }
}

struct NowPlayingMainView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingMainView()
            .environmentObject(NowPlayingObject())
    }
}
