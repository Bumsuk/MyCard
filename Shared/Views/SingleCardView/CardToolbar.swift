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
