//
//  UserDataObject.swift
//  Neiro
//
//  Created by いちご on 2021/09/02.
//

import Foundation
import upnpx

class UserDataObject: ObservableObject {
    @Published var savedServers:[SavedServer] = []
    
    init() {
        loadAll()
    }
    
    func loadAll() {
        loadSavedServers()
    }

    // savedServersの保存
    func storeSavedServers() {
        var urls: [String] = []
        savedServers.forEach { server in
            if let url = server.url?.absoluteString {
                urls.append(url)
            }
        }
        UserDefaults.standard.set(urls, forKey: "savedServers")
    }
    // savedServersの読み込み
    func loadSavedServers() {
        savedServers.removeAll()
        if let urls = UserDefaults.standard.stringArray(forKey: "savedServers") {
            urls.forEach { url in
                let server = SavedServer()
                server.url = URL(string: url)
                savedServers.append(server)
            }
        }
    }
}
