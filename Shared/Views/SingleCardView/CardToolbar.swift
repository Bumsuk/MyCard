import SwiftUI

struct CardToolbar: ViewModifier {
  @EnvironmentObject var viewState: ViewState
  @Binding var currentModal: CardModal?

  func body(content: Content) -> some View {
    content
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        // swiftlint:disable:next multiple_closures_with_trailing_closure
        Button(action: { viewState.showAllCards.toggle() }) {
          Text("Done")
        }
      }
      ToolbarItem(placement: .bottomBar) {
        CardBottomToolbar(cardModal: $currentModal)
      }
    }
  }
}


// 임시 프리뷰
struct CardToolbar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("프리뷰")
                .modifier(CardToolbar(currentModal: .constant(.framePicker)))
                .navigationTitle("네비바")
                .navigationBarTitleDisplayMode(.inline)
        }
        //.previewLayout(.fixed(width: 818, height: 414))
    }
}
