//
//  BrowserView.swift
//  Neiro
//
//  Created by いちご on 2021/08/29.
//

import SwiftUI

struct BrowserView: View {
    var body: some View {

        List {
            NavigationLink(destination: self) {
                Text("Albums")
            }
            NavigationLink(destination: self) {
                Text("Artists")
            }
            NavigationLink(destination: self) {
                Text("Genre")
            }
        }
        .navigationTitle("Music Server")
    }
}

struct BrowserView_Previews: PreviewProvider {
    static var previews: some View {
        BrowserView()
    }
}
