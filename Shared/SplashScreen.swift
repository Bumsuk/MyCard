//
//  SplashScreen.swift
//  MyCards
//
//  Created by brown on 2021/07/21.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack(alignment: .center) {
            Color("background")

            card(letter: "S", color: "appColor1")
                .modifier(SplashAnimation(finalYPosition: 240, delay: 0))
            
            card(letter: "D", color: "appColor2")
                .modifier(SplashAnimation(finalYPosition: 120, delay: 0.2))

            card(letter: "R", color: "appColor3")
                .modifier(SplashAnimation(finalYPosition: 0, delay: 0.4))
            
            card(letter: "A", color: "appColor6")
                .modifier(SplashAnimation(finalYPosition: -120, delay: 0.6))
            
            card(letter: "C", color: "appColor7")
                .modifier(SplashAnimation(finalYPosition: -240, delay: 0.8))
        }
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
            /*
            .transaction {
                $0.animation = $0.animation?.delay(delay)
            }
            */
            .rotationEffect(.degrees(Double.random(in: -10...10)), anchor: .center)
            // .animation(.interpolatingSpring(mass: 0.2, stiffness: 80, damping: 5, initialVelocity: 0.0).delay(delay))
            .onAppear(perform: {
                //withAnimation(.easeInOut(duration: 0.5).delay(delay)) {
                withAnimation(.interpolatingSpring(mass: 0.2, stiffness: 80, damping: 5, initialVelocity: 0.0).delay(delay)) {
                    animating = false
                }
            })
    }
}
