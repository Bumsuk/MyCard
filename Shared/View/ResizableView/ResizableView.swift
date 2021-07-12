//
//  ResizableView.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

struct ResizableView: View {
    @State private var transform = Transform() // 이후 binding으로 변경예정!
    private let content = RoundedRectangle(cornerRadius: 30.0)
    private let color = Color.red

    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                transform.offset = value.translation
                print("[onChange] \(value) > \(transform.offset)")
            }

        content
            .frame(width: transform.size.width,
                   height: transform.size.height,
                   alignment: .center)
            .foregroundColor(color)
            .offset(transform.offset)
            .gesture(dragGesture)
    }
}

struct ResizableView_Previews: PreviewProvider {
    static var previews: some View {
        ResizableView()
    }
}
