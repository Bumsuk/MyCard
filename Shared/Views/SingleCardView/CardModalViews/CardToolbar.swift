import SwiftUI

struct CardToolbar: ViewModifier {
    @EnvironmentObject var viewState: ViewState
    @Binding var currentModal: CardModal?

    func body(content: Content) -> some View {
        content
            .toolbar {
                // 상단 툴바 왼쪽
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        viewState.shouldScreenshot = true
                        currentModal = .shareSheet
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                }
                
                // 상단 툴바 오른쪽
                ToolbarItem(placement: .navigationBarTrailing) {
                    // swiftlint:disable:next multiple_closures_with_trailing_closure
                    Button(action: {
                        withAnimation {
                            viewState.showAllCards.toggle()
                        }
                    }) {
                        Text("Done")
                    }
                }

                // 하단 툴바
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
        .environmentObject(ViewState(card: .init()))
        // .previewLayout(.fixed(width: 818, height: 414))
    }
}
