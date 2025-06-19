import SwiftUI

struct CustomTabBar: View {
  let tabBarHeight: CGFloat = 80

  var body: some View {
    VStack(spacing: 0) {
      LinearGradient(
        gradient: Gradient(stops: [
          .init(color: .tabbarGradient.opacity(0),
                location: 0.00),
          .init(color: .tabbarGradient.opacity(0.65),
                location: 0.45),
          .init(color: .tabbarGradient.opacity(0.8),
                location: 0.60),
          .init(color: .tabbarGradient,
                location: 1.00),
        ]),
        startPoint: .top,
        endPoint: .bottom
      )
      .frame(height: 40)

      Color(.tabbarStroke)    // thin separator
        .frame(height: 1)

      ZStack {
        Rectangle()           // bar fill
          .fill(.tabbarFill)
          .frame(height: tabBarHeight)

        HStack {
          TabsView(hasNotifyBadge: true, icon: .pokerCards, tabName: "Cards")
          TabsView(icon: .bonfire, tabName: "Bonfire")
          TabsView(isActive: true, icon: .matches, tabName: "Matches")
          TabsView(isProfileTab: true, icon: .marie, tabName: "Profile")
        }
        .padding(.bottom, 20)
      }
    }
    .ignoresSafeArea(edges: .bottom)
  }
}


#Preview {
  CustomTabBar()
}
