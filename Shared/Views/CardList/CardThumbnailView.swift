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
        Group {
            if let image = UIImage.load(uuidString: card.id.uuidString) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                card.backgroundColor
            }
        }
        .cornerRadius(10)
        .frame(width: Settings.thumbnailSize(size: size).width,
               height: Settings.thumbnailSize(size: size).height,
               alignment: .center)
        // .shadow(color: Color("shadow-color"), radius: 3, x: 0, y: 0)
        .shadow(color: card.backgroundColor, radius: 3, x: 0, y: 0)
        // .shadow(color: Color.red, radius: 3, x: 0, y: 0)
    }
}

struct CardThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        CardThumbnailView(card: initialCards[1])
            .preferredColorScheme(.dark)
    }
}
