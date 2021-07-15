//
//  CircleAnimView.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

struct CircleAnimView: View {
    @State var degrees: CGFloat = 0
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.2)
            .stroke(Color.red, lineWidth: 5)
            .rotationEffect(Angle(degrees: Double(degrees)))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: degrees)
            .padding() // 기본 패딩을 주자!
            .onAppear() {
                DispatchQueue.main.async {
                    degrees = 360
                }
            }
    }
}

struct CirclAnimView_Previews: PreviewProvider {
    static var previews: some View {
        CircleAnimView()
    }
}
