//
//  CardDetailView.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

// 카드 상세뷰
struct CardDetailView: View {
    @EnvironmentObject var viewState: ViewState
    
    var body: some View {
        Color.yellow
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Done", action: {
                        viewState.showAllCards.toggle()
                    })
                }
            }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView()
            .environmentObject(ViewState())
    }
}
