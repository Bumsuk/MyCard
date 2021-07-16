//
//  AnyShapeView.swift
//  MyCards
//
//  Created by brown on 2021/07/16.
//

import SwiftUI

struct AnyShape: Shape {
    private let path: (CGRect) -> Path
    
    func path(in rect: CGRect) -> Path {
        path(rect)
    }

    init<CustomShape: Shape>(_ shape: CustomShape) {
        self.path = { rect in
            shape.path(in: rect)
        }
    }
}
