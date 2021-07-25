//
//  CardsListView.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

// 카드 리스트뷰
struct CardsListView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var store: CardStore

    func columns(size: CGSize) -> [GridItem] {
         [GridItem(.adaptive(minimum: Settings.thumbnailSize(size: size).width))]
    }

    var body: some View {
        GeometryReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns(size: proxy.size)) {
                    ForEach(store.cards) { card in
                        CardThumbnailView(card: card, size: proxy.size)
                            .contextMenu(menuItems: {
                                // swiftlint:disable:next multiple_closures_with_trailing_closure
                                Button(action: { store.remove(card) }) {
                                    Label("Delete", systemImage: "trash")
                                }
                            })
                            .onTapGesture {
                                viewState.selectedCard = card
                                withAnimation {
                                    viewState.showAllCards = false
                                }
                            }
                    }
                }
                .padding(.all, 10)
            }
        }
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardsListView()
                .environmentObject(ViewState())
                .environmentObject(CardStore(defaultData: true))
                // .previewLayout(.fixed(width: 700, height: 300))
            /*
            CardsListView()
                .previewDevice("iPod touch (7th generation)")
                .environmentObject(ViewState())
                .environmentObject(CardStore(defaultData: true))
            CardsListView()
                .previewDevice("iPad Pro (11-inch) (3rd generation)")
                .environmentObject(ViewState())
                .environmentObject(CardStore(defaultData: true))
            */
        }
        // .previewLayout(.sizeThatFits)
    }
}
