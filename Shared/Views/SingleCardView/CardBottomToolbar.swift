//
//  CardBottomToolbar.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

struct ToolbarButtonView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass // ! 중요
    let modal: CardModal
    
    var body: some View {
        let text = modal.buttonData.text
        let imageName = modal.buttonData.imageName
        
        if verticalSizeClass == .compact {
            compactView(imageName)
        } else {
            regularView(imageName, text)
        }
    }
    
    func regularView(_ imageName: String, _ text: String) -> some View {
        VStack(spacing: 2) {
            Image(systemName: imageName)
            Text(text)
        }
        .frame(minWidth: 60)
        .padding(.top, 5)
    }
    
    func compactView(_ imageName: String) -> some View {
        VStack(spacing: 2) {
            Image(systemName: imageName)
        }
        .frame(minWidth: 60)
        .padding(.top, 5)
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
                //Spacer()
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
                .previewLayout(.device)
                .previewDevice("iPhone 12 Pro Max")
                .preferredColorScheme(.dark)
        }
        .environmentObject(ViewState())
        .previewLayout(.sizeThatFits)
        //.padding()
    }
}
