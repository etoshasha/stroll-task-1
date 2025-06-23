import SwiftUI

struct TabsView: View {
  let tabHeight: CGFloat = 46
  let tabWidth: CGFloat = 38
  var hasNotifyBadge = false
  let badgeHPadding: CGFloat = 4
  let badgeVPadding: CGFloat = 2
  let badgeFontSize: CGFloat = 7
  let badgeValue = "10"
  var isActive: Bool = false
  var isProfileTab: Bool = false

  var icon: ImageResource
  var tabName: String

  var body: some View {
    VStack(spacing: 4) {
      // tab icon
      if isProfileTab {
        ZStack {
          Image(.profileStroke)
            .resizable()
            .opacity(0.75)
            .blendMode(.luminosity)
          Image(.marie)
            .resizable()
            .frame(width: 19.2, height: 19.2)
            .clipShape(.circle)
        }
        .frame(width: 24, height: 24)
        .offset(y: -1)
      } else {
        Image(icon)
          .offset(y: icon == .matches ? 0 : -1)
          .overlay(content: {
            if hasNotifyBadge {
              // notification badge
              NotificationBadge(
                hPadding: badgeHPadding,
                vPadding: badgeVPadding,
                fontSize: badgeFontSize,
                notificationValue: badgeValue,
                hasStrokeBorder: true
              )
              .offset(x: 9, y: -8)
            }
          }
          )
      }
      // tab name
      Text(tabName)
        .font(.proximaNova(size: 10, weight: .semibold))
        .foregroundStyle(isActive ? .accent : .secondaryText)
        .offset(x: isProfileTab ? 1 : 0 , y: isProfileTab || icon == .matches ? -1 : 0)
    }
    .frame(width: tabWidth, height: tabHeight)
  }
}

#Preview {
  TabsView(hasNotifyBadge: true, isActive: false, icon: .pokerCards, tabName: "Cards")

  TabsView(isProfileTab: true, icon: .marie, tabName: "Profile")
}
