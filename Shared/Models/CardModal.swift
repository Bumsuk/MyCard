//
//  CardModal.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import Foundation

enum CardModal: Identifiable, CaseIterable {
    var id: Int { hashValue }
    
    case photoPicker
    case framePicker
    case stickerPicker
    case textPicker
    
    var buttonData: (text: String, imageName: String) {
        switch self {
        case .photoPicker:       return ("Photos", "photo")
        case .framePicker:       return ("Frames", "square.on.circle")
        case .stickerPicker:     return ("Stickers", "heart.circle")
        case .textPicker:        return ("Text", "textformat")
        }
    }
}
