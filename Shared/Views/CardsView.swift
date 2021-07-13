//
//  CardsView.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

// 앱 전체 메인뷰
struct CardsView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var store: CardStore
    
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            CardsListView()
            if !viewState.showAllCards {
                SingleCardView()
            }
        }
        .onAppear(perform: {
        })
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardsView()
                .environmentObject(ViewState())
                .environmentObject(CardStore())
        }
    }
}
