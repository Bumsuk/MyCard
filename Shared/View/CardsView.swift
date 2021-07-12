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
    
    var body: some View {
        ZStack {
            CardsListView()
            if !viewState.showAllCards {
                SingleCardView()
            }
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardsView()
                .environmentObject(ViewState())
            CardsView()
                .previewDevice("iPod touch (7th generation)")
                .environmentObject(ViewState())
        }
    }
}
