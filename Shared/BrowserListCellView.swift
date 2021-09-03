//
//  BrowserListCellView.swift
//  Neiro
//
//  Created by いちご on 2021/08/30.
//

import SwiftUI
import URLImage
import URLImageStore
import CocoaUPnP

struct BrowserListCellView: View {
    var mediaContainer: UPPMediaItem?
    
    var body: some View {
        VStack (alignment: .leading) {
            if let url = mediaContainer?.albumArtURLString {
                HStack {
                    URLImage(URL(string: url)!) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(width: 45, height: 45)
                    Text(mediaContainer?.itemTitle ?? "<Unknown>")
                    Spacer()
                }
                .frame(minWidth: 200, minHeight: 50, maxHeight: 50)
            }else {
                HStack {
                    Image(systemName: "folder")
                    .frame(width: 45, height: 45)
                    Text(mediaContainer?.itemTitle ?? "<Unknown>")
                    Spacer()
                }
                .frame(minWidth: 200, minHeight: 50, maxHeight: 50)
                
            }
        }
        .foregroundColor(.primary)
    }
}

struct BrowserListCellView_Previews: PreviewProvider {
    static var previews: some View {
        BrowserListCellView()
    }
}
