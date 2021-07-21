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
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(.linear(duration: 1)) {
                            showSplash = false
                        }
                    }
                })
        } else {
            CardsView()
                //.transition(.move(edge: .trailing))
                .transition(.slide.combined(with: .scale(scale: 0.5)))
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
