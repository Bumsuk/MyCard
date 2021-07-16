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
    @StateObject var store = CardStore(defaultData: true)
    
    var body: some Scene {
        WindowGroup {
            CardsView()
                .environmentObject(viewState)
                .environmentObject(store)
            
            // ResizableView() // 테스트용
        }
    }
}
