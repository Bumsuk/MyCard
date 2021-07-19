//
//  Card.swift
//  MyCards
//
//  Created by brown on 2021/07/13.
//

import SwiftUI

// 카드 모델
struct Card: Identifiable {
    var id = UUID()
    var backgroundColor: Color = .yellow
    var elements: [CardElement] = []
    
    mutating func addElement(uiImage: UIImage) {
        let imageFilename = uiImage.save() // ! 여기서 파일로 저장 !
        let image = Image(uiImage: uiImage)
        let element = ImageElement(image: image, imageFilename: imageFilename)
        elements.append(element)
        save()
    }
    
    mutating func addElement(_ textElement: TextElement) {
        elements.append(textElement)
        save()
    }
    
    mutating func update(_ element: CardElement?, frame: AnyShape) {
        if let element = element as? ImageElement,
           let idx = element.index(in: elements) {
           var newElement = element
            newElement.frame = frame
            elements[idx] = newElement
            save()
        }
    }
    
    mutating func remove(_ element: CardElement) {
        if let element = element as? ImageElement {
            UIImage.remove(name: element.imageFilename)
        }
        
        if let index = elements.firstIndex(where: { $0.id == element.id }) {
            elements.remove(at: index)
        }
        save()
    }
    
    func save() {
        print("Saving data")
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(self)
            let filename = "\(id).rwcard"
            if let url = FileManager.documentURL?.appendingPathComponent(filename) {
                try data.write(to: url)
            }
        } catch {
            print(error.localizedDescription)

        }
        
    }
}

extension Card: Codable {
    enum CodingKeys: CodingKey {
        case id, backgroundColor, imageElements, textElements
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        self.id = UUID(uuidString: id) ?? UUID()
        
        elements += try container.decode([ImageElement].self, forKey: .imageElements)
        
        elements += try container.decode([TextElement].self, forKey: .textElements)
        
        // Challenge 1 - load the background color
        let components = try container.decode([CGFloat].self, forKey: .backgroundColor)
        backgroundColor = Color.color(components: components)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id.uuidString, forKey: .id)
        // 이미지 요소만 인코딩!
        let imageElements: [ImageElement] = elements.compactMap {
            $0 as? ImageElement
        }
        try container.encode(imageElements, forKey: .imageElements)

        let textElements = elements.compactMap { $0 as? TextElement }
        try container.encode(textElements, forKey: .textElements)
        
        // Challenge 1 - save the background color
        let components = backgroundColor.colorComponents()
        try container.encode(components, forKey: .backgroundColor)
    }
}
