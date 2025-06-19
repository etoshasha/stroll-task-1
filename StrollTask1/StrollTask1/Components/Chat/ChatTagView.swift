import SwiftUI

/// “New chat” or “Your move” pill
struct ChatTagView: View {
  var isNewChat: Bool = false

  var body: some View {
    HStack(spacing: 6) {
      if isNewChat {
        Circle()
          .fill(.title)
          .frame(width: 5)
      }
      Text(isNewChat ? "New chat" : "Your move")
        .font(.proximaNova(size: 10, weight: .semibold))
        .foregroundStyle(.title)
    }
    .padding(.vertical, 2)
    .padding(.horizontal, 8)
    .background(isNewChat ? .newChatTag : .yourMoveChatTag)
    .opacity(0.8)
    .clipShape(.capsule)
  }
}

#Preview {
    ChatTagView()
}
