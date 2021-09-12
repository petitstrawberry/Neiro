//
//  StateManager.swift
//  Shared
//
//  Created by いちご on 2021/09/12.
//

import Foundation

#if os(iOS)
import FlexibleSheet
#endif

class StateManager: ObservableObject {
    #if os(iOS)
    @Published var nowPlayingSheet: BottomSheetState = .min
    #endif
}
