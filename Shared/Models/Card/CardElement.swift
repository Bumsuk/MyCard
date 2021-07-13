//
//  CardElement.swift
//  MyCards
//
//  Created by brown on 2021/07/13.
//

import Foundation
import SwiftUI

// 카드 각 요소
protocol CardElement {
    var id: UUID { get }
    var transform: Transform { get set }
}

struct ImageElement: CardElement {
    var id = UUID()
    var transform = Transform()
    var image: Image
}

struct TextElement: CardElement {
    let id = UUID()
    var transform = Transform()
    var text = ""
    var textColor = Color.black
    var textFont = "San Fransisco"
}

extension CardElement {
    func index(in array: [CardElement]) -> Int? {
        return array.firstIndex { $0.id == id }
    }
}
