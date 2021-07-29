//
//  ViewExtensions.swift
//  MyCards (iOS)
//
//  Created by brown on 2021/07/13.
//

import Foundation
import SwiftUI

extension View {
    func resizableView(transform binding: Binding<Transform>, viewScale: CGFloat = 1) -> some View {
        modifier(ResizableView(transform: binding))
    }
}

extension View {
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    /// ```
    /// Text("Label")
    ///     .isHidden(true)
    /// ```
    ///
    /// Example for complete removal:
    /// ```
    /// Text("Label")
    ///     .isHidden(true, remove: true)
    /// ```
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
