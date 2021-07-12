//
//  CardBottomToolbar.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

struct ToolbarButtonView: View {
    let modal: CardModal
    var body: some View {
        VStack {
            Image(systemName: modal.buttonData.imageName)
                .font(.title)
                .frame(width: 40, height: 40, alignment: .center)
            Text(modal.buttonData.text)
        }
        .padding(.top)
    }
}

struct CardBottomToolbar: View {
    @Binding var cardModal: CardModal?
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(CardModal.allCases, id: \.self) { type in
                Button(action: {
                    cardModal = type
                }, label: {
                    ToolbarButtonView(modal: type)
                })
            }
        }
        .onAppear(perform: {
        })
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
