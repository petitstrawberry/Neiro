//
//  MediaItemListCellView.swift
//  Neiro (iOS)
//
//  Created by いちご on 2021/08/30.
//

import SwiftUI
import upnpx

struct MediaItemListCellView: View {
    var mediaItem: MediaServer1ItemObject?
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(mediaItem?.title ?? "<Unknown>")
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
