//
//  ViewState.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import Foundation

class ViewState: ObservableObject {
    @Published var showAllCards = true {
        didSet {
            if showAllCards {
                selectedCard = nil
            }
        }
    }
    @Published var selectedElement: CardElement?
    
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
