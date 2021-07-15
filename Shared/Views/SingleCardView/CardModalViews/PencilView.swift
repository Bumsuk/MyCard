//
//  PencilView.swift
//  MyCards
//
//  Created by brown on 2021/07/15.
//

import PencilKit
import SwiftUI

struct PencilView: View {
    @State private var canvas = PKCanvasView()

    var body: some View {
        PencilViewRepresentable(canvas: $canvas)
    }
}

struct PencilView_Previews: PreviewProvider {
    static var previews: some View {
        PencilView()
    }
}

struct PencilViewRepresentable: UIViewRepresentable {
    @Binding var canvas: PKCanvasView

    func makeUIView(context: Context) -> some UIView {
        canvas.drawingPolicy = .anyInput
        return canvas
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
