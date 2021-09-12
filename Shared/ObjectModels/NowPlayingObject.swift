//
//  NowPlayingObject.swift
//  Neiro
//
//  Created by いちご on 2021/09/12.
//

import Foundation

class NowPlayingObject: ObservableObject {
    @Published var currentSong: MusicObject = MusicObject()
    @Published var position: Double = 0.0
}
