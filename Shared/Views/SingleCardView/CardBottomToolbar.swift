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
    @Environment(\.verticalSizeClass) var verticalSizeClass // ! 중요
    @Environment(\.horizontalSizeClass) var horizontalSizeClass // ! 중요
    @Binding var cardModal: CardModal?
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
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
            print("🔥 [verticalSizeClass] \(verticalSizeClass), [horizontalSizeClass] \(horizontalSizeClass)")
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
