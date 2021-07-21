//
//  ViewState.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import Foundation

enum CardListState {
    case list, carousel
}

class ViewState: ObservableObject {
    @Published var showAllCards = true {
        didSet {
            if showAllCards {
                selectedCard = nil
            }
        }
    }
    @Published var selectedElement: CardElement?
    @Published var cardListState: CardListState = .list
    var shouldScreenshot = false
    
    var selectedCard: Card? {
        didSet {
            if selectedCard == nil {
                selectedElement = nil
            }
        }
    }
    
    convenience init(card: Card) {
        self.init()
        showAllCards = false
        selectedCard = card
        selectedElement = nil
    }
    
    
}
