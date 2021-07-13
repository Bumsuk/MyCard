//
//  ColorExtensions.swift
//  MyCards (iOS)
//
//  Created by brown on 2021/07/13.
//

import SwiftUI

extension Color {
    static let colors: [Color] = [
        .green, .red, .blue, .gray, .yellow, .pink, .orange, .purple
    ]
    
    static func random() -> Color {
        colors.randomElement() ?? .black
    }
}
