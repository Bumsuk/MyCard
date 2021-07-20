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

    var body: some View {
        GeometryReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(store.cards) { card in
                        CardThumbnailView(card: card)
                            .contextMenu(menuItems: {
                                // swiftlint:disable:next multiple_closures_with_trailing_closure
                                Button(action: { store.remove(card) }) {
                                    Label("Delete", systemImage: "trash")
                                }
                            })
                            .onTapGesture {
                                viewState.selectedCard = card
                                viewState.showAllCards.toggle()
                            }
                    }
                }
            }
        }
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
            .environmentObject(ViewState())
            .environmentObject(CardStore(defaultData: true))
            //.previewLayout(.sizeThatFits)
    }
}
