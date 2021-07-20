//
//  CardThumbnailView.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

// 카드 리스트 아이템뷰
struct CardThumbnailView: View {
    let card: Card
    var size: CGSize = .zero // 부모뷰의 bounds 정보
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(card.backgroundColor)
                .frame(width: Settings.thumbnailSize(size: size).width,
                       height: Settings.thumbnailSize(size: size).height,
                       alignment: .center)
            Text("🤡")
        }
    }
}

struct CardThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        CardThumbnailView(card: initialCards[0])
    }
}
