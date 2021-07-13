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
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(card.backgroundColor)
                .frame(width: Settings.thumbnailSize.width, height: Settings.thumbnailSize.height, alignment: .center)
        
            Text("🤡")
        }
    }
}

struct CardThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        CardThumbnailView(card: initialCards[0])
    }
}