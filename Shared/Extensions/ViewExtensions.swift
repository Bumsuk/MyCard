//
//  ViewExtensions.swift
//  MyCards (iOS)
//
//  Created by brown on 2021/07/13.
//

import Foundation
import SwiftUI

extension View {
    func resizableView(transform binding: Binding<Transform>) -> some View {
        modifier(ResizableView(transform: binding))
    }
}
