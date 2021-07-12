//
//  CardBottomToolbar.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

struct ToolbarButtonView: View {
    var body: some View {
        VStack {
            Image(systemName: "heart.circle").font(.largeTitle)
            Text("Stickers")
        }
        .padding(.top)
    }
}

struct CardBottomToolbar: View {
    @Binding var cardModal: CardModal?
    
    var body: some View {
        HStack {
            Button(action: {
                cardModal = .stickerPicker
            }, label: {
                ToolbarButtonView()
            })
            
            
        }
    }
}

struct CardBottomToolbar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardBottomToolbar(cardModal: .constant(.stickerPicker))
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
