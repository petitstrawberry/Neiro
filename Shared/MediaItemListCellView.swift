//
//  MediaItemListCellView.swift
//  Neiro (iOS)
//
//  Created by いちご on 2021/08/30.
//

import SwiftUI
import CocoaUPnP

struct MediaItemListCellView: View {
    var mediaItem: UPPMediaItem?
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(mediaItem?.itemTitle ?? "<Unknown>")
                Text(mediaItem?.artist ?? "<Unknown>")
                    .font(.caption)
            }
            Spacer()
        }
    }
}

struct MediaItemListView_Previews: PreviewProvider {
    static var previews: some View {
        MediaItemListCellView()
    }
}
