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
    case frmaePicker
    case stickerPicker
    case textPicker
    
    var buttonData: (text: String, imageName: String) {
        switch self {
        case .photoPicker:       return ("Photos", "photo")
        case .frmaePicker:       return ("Frames", "square.on.circle")
        case .stickerPicker:     return ("Stickers", "heart.circle")
        case .textPicker:        return ("Text", "textformat")
        }
    }
}
