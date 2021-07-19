//
//  Transform.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

struct Transform {
    var size = CGSize(width: Settings.defaultElementSize.width,
                      height: Settings.defaultElementSize.height)
    var rotation: Angle = .zero
    var offset: CGSize = .zero
}

extension Transform: Codable {
    
}
