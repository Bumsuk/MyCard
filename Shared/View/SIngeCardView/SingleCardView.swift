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

    var body: some View {
        NavigationView {
            CardDetailView()
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("카드카드!")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SingleCardView()
                .environmentObject(ViewState())
            SingleCardView()
                .previewDevice("iPod touch (7th generation)")
                .environmentObject(ViewState())

        }
    }
}
