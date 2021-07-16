//
//  FramePicker.swift
//  MyCards
//
//  Created by brown on 2021/07/16.
//

import SwiftUI

struct FramePicker: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var frame: AnyShape?
    
    private let colums = [
        GridItem(.adaptive(minimum: 120), spacing: 10, alignment: nil)
    ]
    
    private let style = StrokeStyle(lineWidth: 5, lineJoin: .round)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: colums, alignment: .center, spacing: nil, pinnedViews: [], content: {
                ForEach(0 ..< Shapes.shapes.count, id: \.self) { idx in
                    let shape = Shapes.shapes[idx]                    
                    shape
                        //.stroke(style: style)
                        .stroke(Color.primary, style: style)
                        //.environment(\.colorScheme, .light) // 신기하다 신기해! @_@
                        .background(shape.fill(Color.secondary))
                        .frame(width: 100, height: 120)
                        .padding()
                        .onTapGesture {
                            frame = shape
                            presentationMode.wrappedValue.dismiss()
                        }
                }
            })
            .padding(5)
        }
    }
}

struct FramePicker_Previews: PreviewProvider {
    static var previews: some View {
        FramePicker(frame: .constant(nil))
    }
}
