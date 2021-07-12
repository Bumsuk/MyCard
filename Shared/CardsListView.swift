//
//  CardsListView.swift
//  MyCards
//
//  Created by brown on 2021/07/12.
//

import SwiftUI

struct CardsListView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(0 ..< 10) { _ in
                    CardThumbnailView()
                }
            }
        }
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
    }
}
