import SwiftUI

struct ContentView: View {
  private let tabBarHeight: CGFloat = 100

  var body: some View {
    ZStack(alignment: .bottom) {
      BackgroundView()   // full-screen image + overlay

      ScrollView {
        VStack(spacing: 0) {
          YourTurnHeaderView()    // top header
            .padding(.horizontal, 17)
            .padding(.top, 30)

          MatchCardsSectionView() // horizontal scrollview cards
            .padding(.bottom, 29)

          ChatsHeaderView()       // “Chats” + underline
            .padding(.horizontal, 17)

          ChatListView()          // list of ChatCellView
            .padding(.top, 10)
            .padding(.horizontal, 17)
        }
        // add bottom inset so content scrolls above the tab bar
        .padding(.bottom, tabBarHeight)
      }

      CustomTabBar()            // custom tab bar
        .frame(height: tabBarHeight)
    }
    .edgesIgnoringSafeArea(.bottom)
  }
}

#Preview {
  ContentView()
}
