import SwiftUI

struct TabsView: View {
  let tabHeight: CGFloat = 45
  let tabWidth: CGFloat = 50
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
          Image(icon)
            .resizable()
            .frame(width: 19.2, height: 19.2)
            .clipShape(.circle)
        }
        .frame(width: 24, height: 24)
      } else {
        Image(icon)
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
              .offset(x: 10, y: -8)
            }
          }
          )
      }
      // tab name
      Text(tabName)
        .font(.proximaNova(size: 10, weight: .semibold))
        .foregroundStyle(isActive ? .accent : .secondaryText)
    }
    .frame(maxWidth: .infinity, maxHeight: tabHeight)
  }
}

#Preview {
  TabsView(hasNotifyBadge: true, isActive: false, icon: .pokerCards, tabName: "Cards")

  TabsView(isProfileTab: true, icon: .marie, tabName: "Profile")
}
