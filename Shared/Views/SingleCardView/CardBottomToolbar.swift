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
        VStack(spacing: 5) {
            Image(systemName: modal.buttonData.imageName)
                //.font(.title)
                .frame(width: 20, height: 20, alignment: .center)
            Text(modal.buttonData.text).font(.caption)
        }
        //.padding(.top)
    }
}

struct CardBottomToolbar: View {
    @EnvironmentObject var viewState: ViewState
    @Binding var cardModal: CardModal?
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(CardModal.allCases, id: \.self) { type in
                Button(action: {
                    cardModal = type
                }, label: {
                    ToolbarButtonView(modal: type)
                })
                .disabled(checkDisable(type: type))
                Spacer()
            }
            
            CircleAnimView().frame(width: 60, height: 60, alignment: .center)
            
        }
        .onAppear(perform: {
            
        })
    }
    
    func checkDisable(type: CardModal) -> Bool {
        guard type == .framePicker else { return false }
        
        if viewState.selectedElement != nil &&
            viewState.selectedElement.self is ImageElement {
            return false
        }
        return true
    }
}

struct CardBottomToolbar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardBottomToolbar(cardModal: .constant(.stickerPicker))
                .preferredColorScheme(.dark)
        }
        .environmentObject(ViewState())
        .previewLayout(.sizeThatFits)
        //.padding()
    }
}
