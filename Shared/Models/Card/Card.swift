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
}
