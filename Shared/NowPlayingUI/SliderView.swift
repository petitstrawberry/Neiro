//
//  SliderView.swift
//  Neiro
//
//  Created by いちご on 2021/09/12.
//

import SwiftUI
import Sliders

struct SliderView: View {
    @EnvironmentObject var nowPlaying: NowPlayingObject
    var body: some View {
        ValueSlider(value: $nowPlaying.position, onEditingChanged: {flag in
                    })
            .valueSliderStyle(
                HorizontalValueSliderStyle(
                    track: HorizontalValueTrack(
                        view: Color.white.opacity(0.7),
                        mask: Rectangle().cornerRadius(5.0)
                    ).frame(height: 10),
                    thumbSize: CGSize(width: 0, height: 0),
                    thumbInteractiveSize: CGSize(width: 32, height: 32),
                    options: .interactiveTrack
                )
            )
            .background(
                Color.white.opacity(0.2)
                    .frame(height: 10)
                    .cornerRadius(5.0)
            )
            .frame(height: 10, alignment: .leading)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
            .background(Color.black)
            .environmentObject(NowPlayingObject())
    }
}
