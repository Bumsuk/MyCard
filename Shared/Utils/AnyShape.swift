//
//  AnyShapeView.swift
//  MyCards
//
//  Created by brown on 2021/07/16.
//

import SwiftUI

struct AnyShape: Shape, Equatable {
    static func == (lhs: AnyShape, rhs: AnyShape) -> Bool {
        let rect = CGRect(origin: .zero, size: .init(width: 100, height: 100))

        let lhsPath = lhs.path(in: rect)
        let rhsPath = rhs.path(in: rect)
        
        return lhsPath == rhsPath
    }

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
