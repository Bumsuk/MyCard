//
//  CardElement.swift
//  MyCards
//
//  Created by brown on 2021/07/13.
//

import Foundation
import SwiftUI

// 카드 각 요소
// MARK: - CardElement
protocol CardElement {
    var id: UUID { get }
    var transform: Transform { get set }
}

extension CardElement {
    func index(in array: [CardElement]) -> Int? {
        return array.firstIndex { $0.id == id }
    }
}



// MARK: - ImageElement
struct ImageElement: CardElement {
    var id = UUID()
    var frame: AnyShape? // !
    var transform = Transform()
    var image: Image
    var imageFilename: String? // 인코딩/디코딩을 위한 파일명
}

extension ImageElement: Codable {
    enum CodingKeys: CodingKey {
        case transform, imageFilename, frame
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        transform = try container.decode(Transform.self, forKey: .transform)
        imageFilename = try container.decode(String.self, forKey: .imageFilename)
        if let imageFilename = imageFilename,
           let uiImage = UIImage.load(uuidString: imageFilename) {
            image = Image(uiImage: uiImage)
        } else {
            image = Image("error-image")
        }
        
        if let frameIdx = try container.decodeIfPresent(Int.self, forKey: .frame) {
            frame = Shapes.shapes[frameIdx]
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(transform, forKey: .transform)
        try container.encode(imageFilename, forKey: .imageFilename)
        
        if let frameIdx = Shapes.shapes.firstIndex(where: { $0 == frame }) {
            try container.encode(frameIdx, forKey: .frame)
        }

    }
}


// MARK: - TextElement
struct TextElement: CardElement {
    let id = UUID()
    var transform = Transform()
    var text = ""
    var textColor = Color.black
    var textFont = "San Fransisco"
}

extension TextElement: Codable {
    enum CodingKeys: CodingKey {
        case transform, text, textColor, textFont
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        transform = try container.decode(Transform.self, forKey: .transform)
        text = try container.decode(String.self, forKey: .text)
        let components = try container.decode([CGFloat].self, forKey: .textColor)
        textColor = Color.color(components: components)
        textFont = try container.decode(String.self, forKey: .textFont)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(transform, forKey: .transform)
        try container.encode(text, forKey: .text)
        let components = textColor.colorComponents()
        try container.encode(components, forKey: .textColor)
        try container.encode(textFont, forKey: .textFont)
    }
}
