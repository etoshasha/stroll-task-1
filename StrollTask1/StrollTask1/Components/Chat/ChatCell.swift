import SwiftUI

/// One chat row: profile ↑ message ↓ timestamp + badge ↓ divider
struct ChatCell: View {
  let lineLimit = 2
  var profilePhoto: ImageResource
  var name: String
  var isNewChat: Bool = false
  var hasTag: Bool = true
  var isVoiceMessage: Bool = false
  var textMessage: String?
  var isNewMessage: Bool = false
  var hasTimeStamp: Bool = true
  var hasMessageTag: Bool = false
  var isFavorite: Bool = false

  @State private var hstackWidth: CGFloat = 0

  var body: some View {
    VStack(alignment: .trailing, spacing: hasTag ? 10 : 5.5) {
      HStack(alignment: .top) {
        // profile photo
        Image(profilePhoto)
          .shadow(radius: 5)
          .offset(x: -2, y: 2)

        // name + optional tag + message

        let vSpacing: CGFloat = {
                 if isVoiceMessage {
                   return 10
                 } else if textMessage != nil {
                   return hasTag ? 4 : 2.5
                 } else {
                   return 2.5
                 }
               }()

        VStack(alignment: .leading, spacing: vSpacing) {
          HStack(spacing: 10) {
            Text(name)
              .font(.proximaNova(size: 16, weight: .bold))
              .foregroundStyle(.title)
            if hasTag {
              ChatTagView(isNewChat: isNewChat)
            }
          }
          if isVoiceMessage {
            VoiceMessageView()
              .padding(.top, -3)
          } else if let text = textMessage {
            Text(text)
              .font(.proximaNova(size: 14, weight: isNewMessage ? .semibold : .regular))
              .foregroundStyle(isNewMessage ? .matchBadgeText : .sentMessage)
              .lineSpacing(isNewMessage ? 2 : 0.6)
              .lineLimit(lineLimit)
              .layoutPriority(1)
          }
        }
        .padding(.leading, 6)

        Spacer()

        // timestamp + optional badge
        VStack(alignment: .trailing, spacing: 6) {
          Text(hasTimeStamp ? "6:21 pm" : "Wed")
              .font(.proximaNova(size: 12, weight: .semibold))
              .foregroundStyle(hasTimeStamp ? .timeStamp : .secondaryTitle)

          if hasMessageTag {
            NotificationBadge(
              hPadding: 5,
              vPadding: 1,
              fontSize: 10,
              notificationValue: isFavorite ? "★" : "4",
              hasStrokeBorder: false
            )
          }
        }
        .offset(x: 1, y: 2)
      }
      // capture HStack width
      .background(
        GeometryReader { geo in
          Color.clear
            .preference(key: HStackWidthKey.self, value: geo.size.width)
        }
      )

      // divider that’s 83% of that width, left-aligned
      Rectangle()
        .fill(Color.divider)
        .frame(width: hstackWidth * 0.835, height: 0.5)
        .frame(maxWidth: .infinity, alignment: .trailing)
        .offset(y: 0.5)
    }
    .padding(.top, 7)
    .onPreferenceChange(HStackWidthKey.self) { self.hstackWidth = $0 }
  }
}

#Preview {
  ChatCell(profilePhoto: .jessica, name: "Jessica", textMessage: "Hahaha that’s interesting, it does\nseem like people here are starting to like house music more", isNewMessage: true)
}
