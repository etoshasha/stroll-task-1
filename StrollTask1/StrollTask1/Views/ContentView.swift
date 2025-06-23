import SwiftUI

struct ContentView: View {
  private let tabBarHeight: CGFloat = 98

  var body: some View {
    ZStack(alignment: .bottom) {
      BackgroundView()   // full-screen image + overlay

      ScrollView {
        VStack(spacing: 0) {
          YourTurnHeaderView()    // top header
            .padding(.horizontal, 17)
            .padding(.top, 33.5)

          MatchCardsSectionView() // horizontal scrollview cards
            .padding(.top, 20)
            .padding(.bottom, 29)

          ChatsHeaderView()       // “Chats” + underline
            .padding(.horizontal, 17)
            .padding(.bottom, 10)

          ChatListView()          // list of ChatCellView
            .padding(.horizontal, 17)
        }
        // bottom inset so content scrolls above the tab bar
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
