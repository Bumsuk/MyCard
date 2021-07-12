//
//  ResizableView.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

struct ResizableView: View {
    @State private var transform = Transform() // 이후 binding으로 변경예정!
    @State private var previousOffset: CGSize = .zero
    @State private var previousRotation: Angle = .zero
    
    private let content = RoundedRectangle(cornerRadius: 30.0)
    private let color = Color.red

    var body: some View {
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
        

        content
            .frame(width: transform.size.width,
                   height: transform.size.height,
                   alignment: .center)
            .foregroundColor(color)
            
            .offset(transform.offset)
            .rotationEffect(transform.rotation)
            .gesture(dragGesture)
            .gesture(rotationGesture)
    }
}

struct ResizableView_Previews: PreviewProvider {
    static var previews: some View {
        ResizableView()
    }
}
