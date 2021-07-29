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

    var body: some View {
        VStack {
            ListSelectionView(selection: $viewState.cardListState)

            ZStack {
                switch viewState.cardListState {
                case .list:
                    CardsListView()
                case .carousel:
                    Carousel()
                }
                
                VStack {
                    Spacer()
                    createButton
                }
                
                if !viewState.showAllCards {
                    SingleCardView()
                        .zIndex(1)
                        .transition(.move(edge: .bottom))
                }
            }
            // .background(Color("background").edgesIgnoringSafeArea(.all))
            //.background(Color.gray.opacity(0.3).edgesIgnoringSafeArea(.all))
            .onAppear(perform: {})
        }
    }
    
    var createButton: some View {
        Button(action: {
            viewState.selectedCard = store.addCard()
            withAnimation {
                viewState.showAllCards = false
            }
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
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardsView()
                .previewLayout(.sizeThatFits)
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
