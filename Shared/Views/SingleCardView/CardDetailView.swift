//
//  CardDetailView.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

// 카드 상세뷰(네비게이션뷰에 서브뷰로 포함됨)
struct CardDetailView: View {
    @EnvironmentObject var viewState: ViewState
    @Environment(\.scenePhase) private var scenePhase
    @State private var currentModal: CardModal?
    @State private var stickerImage: UIImage?
    @State private var frame: AnyShape?
    @State private var images: [UIImage] = []
    @State private var textElement = TextElement()
    @Binding var card: Card
        
    var body: some View {
        content
            .modifier(CardToolbar(currentModal: $currentModal))
            .onDrop(of: [.image], delegate: CardDrop(card: $card))
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
                }
            }
            .onAppear(perform: {

            })
            .onDisappear(perform: {
                card.save()
            })
            .onChange(of: scenePhase, perform: { newPhase in
                print(#function, "[onChange] newPhase : \(newPhase)")
                if newPhase == .inactive {
                    card.save()
                }
            })
    }
    
    var content: some View {
        ZStack {
            card.backgroundColor.ignoresSafeArea()
                .onTapGesture(perform: {
                    viewState.selectedElement = nil
                })
            
            ZStack {
                ForEach(card.elements, id: \.id) { element in
                    CardElementView(element: element, selected: element.id == viewState.selectedElement?.id)
                        .contextMenu {
                            Button(action: { card.remove(element) }, label: {
                                Label("Delete", systemImage: "trash")
                            })
                        }
                        .resizableView(transform: self.bindingTransform(for: element))
                        .frame(width: element.transform.size.width,
                               height: element.transform.size.height)
                        .onTapGesture {
                            viewState.selectedElement = element
                        }
                    
                }
            }
        }
    }
    
    func bindingTransform(for element: CardElement) -> Binding<Transform> {
        guard let index = element.index(in: card.elements) else {
            fatalError("Element does not exist!")
        }
        return $card.elements[index].transform
    }
}

struct CardDetailView_Previews: PreviewProvider {
 
    struct CardDetailPreview: View {
        @State var card = initialCards[0]
        
        var body: some View {
            CardDetailView(card: $card)
                .environmentObject(ViewState(card: card))
        }
    }
    
    static var previews: some View {
        CardDetailPreview()
    }
}
