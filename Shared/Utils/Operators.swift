//
//  Operators.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import Foundation
import SwiftUI

// 원래 이렇게 쉽게 연산자 재정의가 되는게 아니었던 것 같은디....
func + (left: CGSize, right: CGSize) -> CGSize {
    CGSize(
        width: left.width + right.width,
        height: left.height + right.height)
}
