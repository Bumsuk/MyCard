//
//  Settings.swift
//  MyCards (iOS)
//
//  Created by brown on 2021/07/13.
//

import SwiftUI

enum Settings {
    static let cardSize = CGSize(width: 1300, height: 2000)
    // static let thumbnailSize = CGSize(width: 150, height: 250)
    static func thumbnailSize(size: CGSize) -> CGSize {
        let threshold: CGFloat = 500
        var scale: CGFloat = 0.12
        if size.width > threshold && size.height > threshold {
            scale = 0.3
        }
        
        return .init(width: Settings.cardSize.width * scale,
                     height: Settings.cardSize.height * scale)
    }
    static let defaultElementSize = CGSize(width: 800, height: 800)
    static let borderColor: Color = .blue
    static let borderWidth: CGFloat = 5
}
