import SwiftUI

/// Chats dialogs list
struct ChatListView: View {
  var body: some View {
    ForEach(ChatCellConfig.all) { cfg in
      ChatCell(
        profilePhoto:   cfg.profilePhoto,
        name:           cfg.name,
        isNewChat:      cfg.isNewChat,
        hasTag:         cfg.hasTag,
        isVoiceMessage: cfg.isVoiceMessage,
        textMessage:    cfg.textMessage,
        isNewMessage:   cfg.isNewMessage,
        hasTimeStamp:   cfg.hasTimeStamp,
        hasMessageTag:  cfg.hasMessageTag,
        isFavorite:     cfg.isFavorite
      )
    }
  }
}

#Preview {
  ChatListView()
}
