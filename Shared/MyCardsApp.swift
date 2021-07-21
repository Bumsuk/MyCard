//
//  MyCardsApp.swift
//  Shared
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

@main
struct MyCardsApp: App {
    @StateObject var viewState = ViewState()
    @StateObject var store = CardStore(defaultData: false)

    var body: some Scene {
        WindowGroup {
            // CardsView()
            AppLoadingView()
                .environmentObject(viewState)
                .environmentObject(store)
                .onAppear(perform: {
                    print(FileManager.documentURL ?? "")
                })
        }
    }
}

