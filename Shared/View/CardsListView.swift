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
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(0 ..< 10) { _ in
                    CardThumbnailView()
                        .onTapGesture {
                            viewState.showAllCards.toggle()
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
    }
}
