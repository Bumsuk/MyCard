//
//  ListSelectionView.swift
//  MyCards
//
//  Created by brown on 2021/07/29.
//

import SwiftUI

struct ListSelectionView: View {
    @Binding var selection: CardListState
    
    var body: some View {
        Picker("피커피커!", selection: $selection) {
            Image(systemName: "square.grid.2x2.fill")
                .tag(CardListState.list)
            Image(systemName: "rectangle.stack.fill")
                .tag(CardListState.carousel)
        }
        .pickerStyle(SegmentedPickerStyle())
        .frame(width: 200)
    }
}

struct ListSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ListSelectionView(selection: .constant(.list))
    }
}
