//
//  PhotoPicker.swift
//  MyCards
//
//  Created by brown on 2021/07/14.
//

import SwiftUI


struct PhotoPicker: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let label = UILabel()
        label.text = "헬로우! UIKit11!"
        label.layer.cornerRadius = 30.0
        label.backgroundColor = .systemYellow
        return label
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}


struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker()
    }
}
