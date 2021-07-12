//
//  Operators.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import Foundation
import SwiftUI

func + (left: CGSize, right: CGSize) -> CGSize {
    CGSize(
        width: left.width + right.width,
        height: left.height + right.height)
}
