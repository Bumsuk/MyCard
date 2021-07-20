//
//  CardElementView.swift
//  MyCards
//
//  Created by brown on 2021/07/13.
//

import SwiftUI

struct CardElementView: View {
    let element: CardElement
    let selected: Bool // 터치로 선택된 상태여부

    var body: some View {
        switch element {
        case is ImageElement:
            ImageElementView(element: element as! ImageElement, selected: selected)
        case is TextElement:
            TextElementView(element: element as! TextElement)
                .border(Settings.borderColor, width: selected ? Settings.borderWidth : 0)
        default:
            Text("해당사항 없음!").foregroundColor(.gray)
        }
    }
}

struct ImageElementView: View {
    let element: ImageElement
    let selected: Bool // 터치로 선택된 상태여부
    let angGradient = AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]),
                                      center: .center,
                                      startAngle: .zero,
                                      endAngle: .degrees(360))
    
    var bodyMain: some View {
        element.image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }

    var body: some View {
        if let frame = element.frame {
            bodyMain
                .clipShape(frame)
                .overlay(frame.stroke(Settings.borderColor, lineWidth: selected ? 5.0 : 0))
                .contentShape(frame)
        } else {
            bodyMain
                .border(Settings.borderColor, width: selected ? Settings.borderWidth : 0)
        }
    }
}

struct TextElementView: View {
    let element: TextElement

    var body: some View {
        if !element.text.isEmpty {
            Text(element.text)
                .font(.custom(element.textFont, size: 200))
                .foregroundColor(element.textColor)
                .scalableText()
        }
    }
}

struct CardElementView_Previews: PreviewProvider {
    static var previews: some View {
        CardElementView(element: initialCards[0].elements[3], selected: false)
    }
}
