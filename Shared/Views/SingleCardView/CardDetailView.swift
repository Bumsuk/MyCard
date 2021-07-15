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
    @State private var currentModal: CardModal?
    @State private var stickerImage: UIImage?
    @State private var images: [UIImage] = []
    @Binding var card: Card
        
    var body: some View {
        content
            .modifier(CardToolbar(currentModal: $currentModal))
            .onDrop(of: [.image], isTargeted: nil, perform: { providers, point in
                print("[onDrop!] \(providers), \(point)")
                for item in providers {
                    if item.canLoadObject(ofClass: UIImage.self) {
                        item.loadObject(ofClass: UIImage.self) { image, _ in
                            if let image = image as? UIImage {
                                DispatchQueue.main.async {
                                    card.addElement(uiImage: image)
                                }
                            }
                        }
                    }
                }
                
                return true
            })
            .sheet(item: $currentModal) { item in // item 변화에 반응해 sheet 표시!
                switch item {
                case .stickerPicker:
                    StickerPicker(stickerImage: $stickerImage)
                        .onDisappear(perform: {
                            if let stickerImage = stickerImage {
                                card.addElement(uiImage: stickerImage)
                            }
                            stickerImage = nil
                        })
                case .photoPicker:
                    PhotoPicker(images: $images)
                        .onDisappear(perform: {
                            for image in images {
                                card.addElement(uiImage: image)
                            }
                            images.removeAll()
                        })
                default:
                    EmptyView()
                }
            }
            .onAppear(perform: {

            })
    }
    
    var content: some View {
        ZStack {
            card.backgroundColor.ignoresSafeArea()
            
            ZStack {
                ForEach(card.elements, id: \.id) { element in
                    CardElementView(element: element)
                        .resizableView(transform: self.bindingTransform(for: element))
                        .frame(width: element.transform.size.width,
                               height: element.transform.size.height)
                        .contextMenu {
                            Button(action: { card.remove(element) }, label: {
                                Label("Delete", systemImage: "trash")
                            })
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
