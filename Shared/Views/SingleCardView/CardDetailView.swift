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
    @Binding var card: Card
        
    var body: some View {
        content
            .modifier(CardToolbar(currentModal: $currentModal))
            .sheet(item: $currentModal) { item in // item 변화에 반응해 sheet 표시!
                switch item {
                case .stickerPicker:
                    StickerPicker()
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
