//
//  SingleCardView.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

// 카드 상세뷰 네비
struct SingleCardView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var store: CardStore

    var noData: some View { // 안씀
        Text("암것도 없으요!").foregroundColor(.gray)
    }
    
    var body: some View {
        if let selectedCard = viewState.selectedCard {
            if let index = store.index(for: selectedCard) {
                NavigationView {
                    CardDetailView(card: $store.cards[index])
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("Card!")
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .onAppear(perform: {
                })
            }
        }
    }
}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SingleCardView()
                .environmentObject(ViewState(card: initialCards[0]))
                .environmentObject(CardStore(defaultData: true))
        }
    }
}
