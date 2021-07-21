//
//  AppLoadingView.swift
//  MyCards
//
//  Created by brown on 2021/07/21.
//

import SwiftUI

struct AppLoadingView: View {
    @State private var showSplash = true
    
    var body: some View {
        if showSplash {
            SplashScreen()
                .edgesIgnoringSafeArea(.all)
        } else {
            CardsView()
        }
    }
}

struct AppLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppLoadingView()
                .environmentObject(ViewState(card: .init()))
                .environmentObject(CardStore(defaultData: true))
        }
    }
}
