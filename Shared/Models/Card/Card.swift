//
//  Card.swift
//  MyCards
//
//  Created by brown on 2021/07/13.
//

import SwiftUI

// 카드 모델
struct Card: Identifiable {
    var id = UUID()
    var backgroundColor: Color = .yellow
    var elements: [CardElement] = []
    
    mutating func addElement(uiImage: UIImage) {
        let image = Image(uiImage: uiImage)
        let element = ImageElement(image: image)
        elements.append(element)
    }
    
    mutating func update(_ element: CardElement?, frame: AnyShape) {
        if let element = element as? ImageElement,
           let idx = element.index(in: elements) {
           var newElement = element
            newElement.frame = frame
            elements[idx] = newElement
        }
    }
    
    mutating func remove(_ element: CardElement) {
        if let index =  elements.firstIndex(where: { $0.id == element.id }) {
            elements.remove(at: index)
        }
    }
}
