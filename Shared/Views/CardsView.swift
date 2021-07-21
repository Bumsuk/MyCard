//
//  CardsView.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

// 앱 전체 메인뷰
struct CardsView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var store: CardStore

    @State var count: Int = 0

    var createButton: some View {
        Button(action: {
            viewState.selectedCard = store.addCard()
            viewState.showAllCards = false
        }, label: {
            Label("Create New", systemImage: "plus")
                .frame(maxWidth: .infinity)
        })
        .font(.system(size: 16, weight: .bold))
        .frame(maxWidth: .infinity)
        .padding([.top, .bottom], 10)
        .background(Color("barColor"))
        .accentColor(.white)
    }

    var body: some View {
        ZStack {
            CardsListView()

            VStack {
                Spacer()
                createButton
            }

            if !viewState.showAllCards {
                SingleCardView()
                    .transition(.move(edge: .bottom))
            }
        }
        // .background(Color("background").edgesIgnoringSafeArea(.all))
        //.background(Color.gray.opacity(0.3).edgesIgnoringSafeArea(.all))
        .onAppear(perform: {})
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardsView()
                .environmentObject(ViewState())
                .environmentObject(CardStore(defaultData: true))
                //.preferredColorScheme(.light)
                .preferredColorScheme(.dark)
            
            
            /*
            CardsView()
                .previewDevice("iPod touch (7th generation)")
                .environmentObject(ViewState())
                .environmentObject(CardStore(defaultData: true))
            */
        }
    }
}
