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
    @Binding var card: Card
        
    var body: some View {
        GeometryReader { proxy in
            content(size: proxy.size)
                .modifier(CardToolbar(currentModal: $currentModal))
                .modifier(CardModals(card: $card, currentModal: $currentModal))

                // 일단 기지정된 카드 사이즈 리율에 맞춰 세로/가로 기기 방향에 맞춰 표시
                .frame(width: calculateSize(proxy.size).width,
                       height: calculateSize(proxy.size).height)
                .clipped()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                .onDrop(of: [.image], delegate: CardDrop(card: $card,
                                                         size: proxy.size,
                                                         frame: proxy.frame(in: .global)))
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        print("[size] \(proxy.size)")
                        print("[frame - .local] \(proxy.frame(in: .local))")
                        print("[frame - .global] \(proxy.frame(in: .global))")
                    }
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
    }
    
    func content(size: CGSize) -> some View {
        ZStack {
            card.backgroundColor.ignoresSafeArea()
                .onTapGesture(perform: {
                    viewState.selectedElement = nil
                })
            
            ZStack {
                ForEach(card.elements, id: \.id) { element in
                    CardElementView(element: element,
                                    selected: element.id == viewState.selectedElement?.id)
                        .contextMenu {
                            Button(action: { card.remove(element) }, label: {
                                Label("Delete", systemImage: "trash")
                            })
                        }
                        .resizableView(transform: self.bindingTransform(for: element),
                                       viewScale: calculateScale(size))
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
    
    // 사이즈 계산? 종횡비 계산이 왤케 이해가 안되냐?? 가로/세로 나누기 비율인데 계산식이 좀...
    func calculateSize(_ size: CGSize) -> CGSize {
        var newSize = size
        let ratio = Settings.cardSize.width / Settings.cardSize.height // 1300 x 2000
        
        if size.width < size.height { // 포트레이트
            newSize.height = min(size.height, newSize.width / ratio)
            newSize.width = min(size.width, newSize.height * ratio)
        } else { // 랜드스케이프
            newSize.width = min(size.width, newSize.height * ratio)
            newSize.height = min(size.height, newSize.width / ratio)
        }
        
        return newSize
    }
    
    func calculateScale(_ size: CGSize) -> CGFloat {
        let newSize = calculateSize(size)
        return newSize.width / Settings.cardSize.width
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
