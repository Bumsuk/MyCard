//
//  Animations.swift
//  MyCards
//
//  Created by brown on 2021/07/21.
//

import SwiftUI


// MARK: - 플로팅 애니메이션
struct Floating: ViewModifier {
    @State var finalYPostion: CGFloat = 0
    @State var animating = true
    var offset: CGFloat = -10
    
    func body(content: Content) -> some View {
        content
            .offset(x: 0, y: animating ? offset : finalYPostion)
            .transaction {
                $0.animation = .easeInOut
                    .delay(0.0)
                    .speed(0.5)
                    .repeatForever()
            }
            .onAppear(perform: {
                withAnimation {
                    animating = false
                }
            })
    }
}

extension View {
    func floatingAnimation(offset: CGFloat = 10) -> some View {
        self.modifier(Floating(offset: offset))
    }
}

