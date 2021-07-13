//
//  CardStore.swift
//  MyCards
//
//  Created by brown on 2021/07/13.
//

import SwiftUI

class CardStore: ObservableObject {
    @Published var cards: [Card] = []
    
    init(defaultData: Bool = false) {
        if defaultData {
            cards = initialCards
        }
    }
}
