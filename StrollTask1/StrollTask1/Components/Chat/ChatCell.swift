import SwiftUI

/// One chat row: profile ↑ message ↓ timestamp + badge ↓ divider
struct ChatCell: View {
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
    VStack(alignment: .trailing, spacing: 8) {
      HStack(alignment: .top) {
        // profile photo
        Image(profilePhoto)
          .resizable()
          .frame(width: 51.67, height: 52.36)
          .clipShape(Capsule())
          .shadow(radius: 5)

        // name + optional tag + message
        VStack(alignment: .leading, spacing: isVoiceMessage ? 7 : 2) {
          HStack {
            Text(name)
              .font(.proximaNova(size: 16, weight: .bold))
              .foregroundStyle(.title)
            if hasTag {
              ChatTagView(isNewChat: isNewChat)
            }
          }
          if isVoiceMessage {
            VoiceMessageView()
          } else if let text = textMessage {
            Text(text)
              .font(.proximaNova(size: 14, weight: isNewMessage ? .semibold : .regular))
              .foregroundStyle(isNewMessage ? .matchBadgeText : .sentMessage)
              .lineLimit(2)
          }
        }
        .padding(.leading, 10)

        Spacer()

        // timestamp + optional badge
        VStack(alignment: .trailing, spacing: 5) {
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
        .frame(width: hstackWidth * 0.83, height: 0.5)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    .onPreferenceChange(HStackWidthKey.self) { self.hstackWidth = $0 }
  }
}

#Preview {
  ChatCell(profilePhoto: .jessica, name: "Jessica", textMessage: "Lol I love house music too")
}
