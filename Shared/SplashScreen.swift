//
//  SplashScreen.swift
//  MyCards
//
//  Created by brown on 2021/07/21.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        card(letter: "C", color: "appColor7")
            .modifier(SplashAnimation(finalYPosition: 200, delay: 0))
    }

    func card(letter: String, color: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .shadow(radius: 3)
                .frame(width: 120, height: 160)
                .foregroundColor(.white)

            Text(letter)
                .fontWeight(.bold)
                // .font(.system(size: 80))
                .scalableText()
                .frame(width: 100)
                .foregroundColor(Color(color))
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

// 애니메이션 수정자
private struct SplashAnimation: ViewModifier {
    @State private var animating = true
    let finalYPosition: CGFloat
    let delay: Double

    func body(content: Content) -> some View {
        content
            .offset(x: 0, y: animating ? -700 : finalYPosition)
            .onAppear(perform: {
                withAnimation {
                    animating = false
                }
            })
    }
}
