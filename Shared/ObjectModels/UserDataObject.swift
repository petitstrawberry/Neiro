//
//  UserDataObject.swift
//  Neiro
//
//  Created by いちご on 2021/09/02.
//

import Foundation
import CocoaUPnP

class UserDataObject: ObservableObject {
    @Published var savedServers:[UPPMediaServerDevice] = []
    
    init() {
        loadAll()
    }
    
    func loadAll() {
        loadSavedServers()
    }

    // savedServersの保存
    func storeSavedServers() {
//        var urls: [String] = []
//        savedServers.forEach { server in
//            if let url = server.url?.absoluteString {
//                urls.append(url)
//            }
//        }
        let archivedData = try! NSKeyedArchiver.archivedData(withRootObject: savedServers, requiringSecureCoding: false)
        UserDefaults.standard.set(archivedData, forKey: "savedServers")
    }
    // savedServersの読み込み
    func loadSavedServers() {
//        if let urls = UserDefaults.standard.stringArray(forKey: "savedServers") {
//            urls.forEach { url in
//                let server = SavedServer()
//                server.url = URL(string: url)
//                savedServers.append(server)
//            }
//        }
        if let storedData = UserDefaults.standard.object(forKey: "savedServers") as? Data {
            if let unarchivedObject = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(storedData) as? [UPPMediaServerDevice] {
                savedServers = unarchivedObject
            }
        }
    }
}
