//
//  CardModals.swift
//  MyCards (iOS)
//
//  Created by brown on 2021/07/19.
//

import SwiftUI

struct CardModals: ViewModifier {
    @EnvironmentObject var viewState: ViewState
    @Binding var card: Card
    @Binding var currentModal: CardModal?
    
    @State private var stickerImage: UIImage?
    @State private var frame: AnyShape?
    @State private var images: [UIImage] = []
    @State private var textElement = TextElement()
    
    @State private var textColor: Color = .black

    func body(content: Content) -> some View {
        content
            .sheet(item: $currentModal) { item in // item 변화에 반응해 sheet 표시!
                switch item {
                case .photoPicker:
                    PhotoPicker(images: $images)
                        .onDisappear(perform: {
                            for image in images {
                                card.addElement(uiImage: image)
                            }
                            images.removeAll()
                        })
                case .framePicker:
                    FramePicker(frame: $frame)
                        .onDisappear(perform: {
                            if let frame = frame {
                                card.update(viewState.selectedElement, frame: frame)
                            }
                            frame = nil
                        })
                case .stickerPicker:
                    StickerPicker(stickerImage: $stickerImage)
                        .onDisappear(perform: {
                            if let stickerImage = stickerImage {
                                card.addElement(uiImage: stickerImage)
                            }
                            stickerImage = nil
                        })
                case .textPicker:
                    TextPicker(textElement: $textElement)
                        .onDisappear(perform: {
                            if !textElement.text.isEmpty {
                                card.addElement(textElement)
                            }
                            textElement = TextElement()
                        })
                case .shareSheet:
                    if let shareImage = card.shareImage {
                        ShareSheetView(activityItems: [shareImage],
                                       applicationActivities: nil)
                            .onDisappear(perform: {
                                card.shareImage = nil
                            })
                    }
                }
            }
    }
}
