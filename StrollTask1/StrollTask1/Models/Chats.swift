import SwiftUI

// MARK: — Chat cell configuration

struct ChatCellConfig: Identifiable {
    let id = UUID()
    let profilePhoto: ImageResource
    let name: String
    let isNewChat: Bool
    let hasTag: Bool
    let isVoiceMessage: Bool
    let textMessage: String?
    let isNewMessage: Bool
    let hasTimeStamp: Bool
    let hasMessageTag: Bool
    let isFavorite: Bool

    static let all: [ChatCellConfig] = [
      .init(profilePhoto: .jessica,
            name:           "Jessica",
            isNewChat:      true,
            hasTag:         true,
            isVoiceMessage: true,
            textMessage:    nil,
            isNewMessage:   false,
            hasTimeStamp:   true,
            hasMessageTag:  true,
            isFavorite:     true),

      .init(profilePhoto: .amandaChat,
            name:           "Amanda",
            isNewChat:      false,
            hasTag:         true,
            isVoiceMessage: false,
            textMessage:    "Lol I love house music too",
            isNewMessage:   true,
            hasTimeStamp:   true,
            hasMessageTag:  false,
            isFavorite:     false),

      .init(profilePhoto: .sila,
            name:           "Sila",
            isNewChat:      false,
            hasTag:         false,
            isVoiceMessage: false,
            textMessage:    "You: I love the people there tbh,\nhave you been?",
            isNewMessage:   false,
            hasTimeStamp:   false,
            hasMessageTag:  false,
            isFavorite:     false),

      .init(profilePhoto: .marie,
            name:           "Marie",
            isNewChat:      false,
            hasTag:         true,
            isVoiceMessage: false,
            textMessage:    "Hahaha that’s interesting, it does\nseem like people here are starting to like house music more",
            isNewMessage:   true,
            hasTimeStamp:   true,
            hasMessageTag:  true,
            isFavorite:     false),

      .init(profilePhoto: .sila,
            name:           "Jessica",
            isNewChat:      false,
            hasTag:         true,
            isVoiceMessage: true,
            textMessage:    nil,
            isNewMessage:   false,
            hasTimeStamp:   true,
            hasMessageTag:  false,
            isFavorite:     false)
    ]
}

