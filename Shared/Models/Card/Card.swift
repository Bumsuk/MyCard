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
    
    mutating func remove(_ element: CardElement) {
        if let index =  elements.firstIndex(where: { $0.id == element.id }) {
            elements.remove(at: index)
        }
    }
}
