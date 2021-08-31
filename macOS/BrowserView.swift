//
//  BrowserView.swift
//  Neiro (macOS)
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI
import upnpx

struct BrowserView: View {
    @EnvironmentObject var discoverUPnP: DiscoverUPnP
    var mediaServer: MediaServer1Device?
    var containerObject: MediaServer1ContainerObject?
    @State var mediaObjects: [MediaServer1BasicObject] = []
    
    var body: some View {
        NavigationView {
            
            List(mediaObjects.indices, id: \.self) { index in
                // mediabjectの種類によって動作を変える
                if mediaObjects[index] is MediaServer1ContainerObject {
                    NavigationLink(
                        destination: BrowserView(mediaServer: mediaServer, containerObject: (mediaObjects[index] as! MediaServer1ContainerObject)).navigationTitle(mediaObjects[index].title ?? ""),
                        label: {
                            BrowserListCellView(mediaContainer: (mediaObjects[index] as! MediaServer1ContainerObject))
                        }
                    )
                }else if mediaObjects[index] is MediaServer1ItemObject {
                    MediaItemListCellView(mediaItem: (mediaObjects[index] as! MediaServer1ItemObject))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(mediaServer?.friendlyName ?? "")
        .onAppear() {
            DispatchQueue.global().async {
                refreshMediaObjects()
            }
        }
    }
    
    func refreshMediaObjects() {
        let objectID = containerObject?.objectID ?? "0"
        let result = NSMutableString()
        let numberReturned = NSMutableString()
        let totalMatches = NSMutableString()
        let updateID = NSMutableString()
        
        if let contentDirectory = mediaServer?.contentDirectory {
            contentDirectory.browse(
                withObjectID: objectID,
                browseFlag: "BrowseDirectChildren",
                filter: "*",
                startingIndex: "0",
                requestedCount: "0",
                sortCriteria: "",
                outResult: result,
                outNumberReturned: numberReturned,
                outTotalMatches: totalMatches,
                outUpdateID: updateID
            )
            
            let mediaObjects = NSMutableArray()
            let parser = MediaServerBasicObjectParser(mediaObjectArray: mediaObjects, itemsOnly: false)
            parser?.parse(from: (result as String).data(using: .utf8))
            
            if let mediaObjects1 = mediaObjects as? [MediaServer1BasicObject] {
                self.mediaObjects = mediaObjects1
            }
        }
    }
}

struct BrowserView_Previews: PreviewProvider {
    static var previews: some View {
        BrowserView()
    }
}
