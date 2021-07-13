//
//  ResizableView.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

struct ResizableView: ViewModifier {
    @State private var transform = Transform() // 이후 binding으로 변경예정!
    @State private var previousOffset: CGSize = .zero
    @State private var previousRotation: Angle = .zero
    @State private var scale: CGFloat = 1.0
    
    func body(content: Content) -> some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                transform.offset = value.translation + previousOffset
                /*
                 transform.offset = CGSize(width: value.translation.width + previousOffset.width,
                 height: value.translation.height + previousOffset.height)
                 */
                print("[onChange] \(value) > \(transform.offset)")
            }
            .onEnded { value in
                previousOffset = transform.offset
            }
        let rotationGesture = RotationGesture()
            .onChanged { angle in
                transform.rotation += angle - previousRotation
                previousRotation = angle
            }
            .onEnded { _ in
                previousRotation = .zero
            }
        let scaleGesture = MagnificationGesture()
            .onChanged { scale in
                self.scale = scale
            }
            .onEnded { scale in
                transform.size.width *= scale
                transform.size.height *= scale
                self.scale = 1.0
            }
        
        content
            .frame(width: transform.size.width,
                   height: transform.size.height,
                   alignment: .center)
            .rotationEffect(transform.rotation)
            .scaleEffect(scale)
            .offset(transform.offset)
            .gesture(dragGesture)
            .gesture(SimultaneousGesture(rotationGesture, scaleGesture)) // 이게 핵심 포인트!

    }
}

struct ResizableView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangle(cornerRadius: 30.0)
            .foregroundColor(.red)
            .modifier(ResizableView())
    }
}
