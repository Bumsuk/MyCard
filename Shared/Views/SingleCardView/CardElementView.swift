//
//  CardElementView.swift
//  MyCards
//
//  Created by brown on 2021/07/13.
//

import SwiftUI

struct CardElementView: View {
    let element: CardElement
    let selected: Bool

    var body: some View {
        switch element {
        case is ImageElement:
            ImageElementView(element: element as! ImageElement)
                .border(Settings.borderColor, width: selected ? Settings.borderWidth : 0)
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

    var bodyMain: some View {
        element.image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }

    var body: some View {
        if let frame = element.frame {
            bodyMain.clipShape(frame)
        } else {
            bodyMain
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
