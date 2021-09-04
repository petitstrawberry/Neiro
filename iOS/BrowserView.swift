//
//  BrowserView.swift
//  Neiro (macOS)
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI
import CocoaUPnP

struct BrowserView: View {
    @EnvironmentObject var discoverUPnP: DiscoverUPnP
    @EnvironmentObject var userData: UserDataObject
    var mediaServer: UPPMediaServerDevice?
    var containerObject: UPPMediaItem?
    @State var isAppeared = false
    @State var mediaObjects: [UPPMediaItem] = []
    @State var alertItem: AlertItem?

    var body: some View {
        ScrollView {
            LazyVStack {
                // List(mediaObjects.indices, id: \.self) { index in
                ForEach(mediaObjects.indices, id: \.self) { index in
                // mediabjectの種類によって動作を変える
                    if mediaObjects[index].isContainer {
                        let browserView = BrowserView(mediaServer: mediaServer, containerObject: mediaObjects[index])

                        NavigationLink(
                            destination: browserView,
                            label: {
                                BrowserListCellView(mediaContainer: mediaObjects[index])
                                    .padding(.horizontal)
                            }
                        )
                    }else {
                        MediaItemListCellView(mediaItem: mediaObjects[index])
                            .padding(.horizontal)
                    }
                    Divider()
                }
            }
        }
        .navigationTitle(containerObject?.itemTitle ?? ( mediaServer?.friendlyName ?? ""))
        .navigationBarTitleDisplayMode(.inline) // Largeタイトル時に表示が崩れるSwiftUIのバグを回避する
        .navigationBarItems(trailing: Button(action: addSavedServer, label: {
            Image(systemName: "plus")
        }))
        .alert(item: $alertItem) { item in
            item.alert
        }
        .onAppear() {
            print("onAppear")
            DispatchQueue.global().async() {
                refreshMediaObjects()
            }
        }
    }

    // mediaObjectsの読み込みのためにcontentDirectoryのBrowseを要求
    func refreshMediaObjects() {
        print(#function)

        if let contentDirectory = mediaServer?.contentDirectoryService() {
            contentDirectory.browse(
                withObjectID: containerObject?.objectID ?? "0",
                browseFlag: "BrowseDirectChildren",
                filter: "*",
                startingIndex: 0,
                requestedCount: 0,
                sortCritera: ""
            ) { response, error in
                if (response != nil) {
                    dump(response)
                    loadResults(results: response!["Result"] as! [AnyHashable?])
                }
            }
        }
    }

    // Browseした結果からMediaObjectsを読み込み
    func loadResults(results: [AnyHashable?]) {
        mediaObjects.removeAll()
        for result in results {
            mediaObjects.append(result as! UPPMediaItem)
        }
    }

    // SavedServerに追加
    func addSavedServer() {
        dump(mediaServer?.baseURL)
        // savedServersに登録されていなければ追加する
        let isNotAdded = userData.savedServers.allSatisfy {
            $0.baseURL != mediaServer?.baseURL
        }
        if isNotAdded {
            userData.savedServers.append(mediaServer!)
            userData.storeSavedServers()
            alertItem = AlertItem(
                alert: Alert(
                    title: Text("完了"),
                    message: Text("SavedServersに\(mediaServer!.friendlyName)を追加しました")
                )
            )
        }else {
            alertItem = AlertItem(
                alert: Alert(
                    title: Text("エラー"),
                    message: Text("\(mediaServer!.friendlyName)は既にSavedServersに追加されています")
                )
            )
        }
    }
}

struct BrowserView_Previews: PreviewProvider {
    static var previews: some View {
        BrowserView()
    }
}
