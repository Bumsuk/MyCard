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
                .transition(.asymmetric(insertion: .slide, removal: .move(edge: .leading)))
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(.linear.speed(1.0)) {
                            showSplash = false
                        }
                    }
                })
        } else {
            CardsView()
                //.transition(.move(edge: .trailing))
                //.transition(.slide.combined(with: .scale))
                // .transition(.move(edge: .top))
                
                .transition(.scale(scale: 0, anchor: .top))
                        
                //.transition(.offset(x: 400, y: 400))
                // .transition(.move(edge: .bottom))
                //.transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .bottom)))
                //.transition(.asymmetric(insertion: .slide, removal: .scale))
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
