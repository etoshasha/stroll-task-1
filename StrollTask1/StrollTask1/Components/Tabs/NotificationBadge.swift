import SwiftUI

struct NotificationBadge: View {
  var hPadding: CGFloat
  var vPadding: CGFloat
  var fontSize: CGFloat
  var notificationValue: String
  var hasStrokeBorder: Bool = false

  var body: some View {
    Text(notificationValue)
      .font(.proximaNova(size: fontSize, weight: .bold))
      .foregroundStyle(.black)
      .padding(.horizontal, hPadding)
      .padding(.vertical, vPadding)
      .background(
        Capsule()
          .fill(.accent)
          .overlay(
            Capsule()
              .stroke(.badgeStroke,
                      lineWidth: hasStrokeBorder ? 1.4 : 0)
          )
      )
  }
}

#Preview {
  NotificationBadge(hPadding: 5, vPadding: 1, fontSize: 10, notificationValue: "4", hasStrokeBorder: true)
}
