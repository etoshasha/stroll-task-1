import SwiftUI

// MARK: — Match card configuration

struct MatchCardConfig: Identifiable {
    enum Style {
        case normal
        case withTagline
        case photoGradient
    }

    let id = UUID()
    let image: ImageResource
    let nameAndAge: String
    let question: String
    let style: Style

    static let all: [MatchCardConfig] = [
        .init(
          image: .amandaBlur,
          nameAndAge: "Amanda, 22",
          question: "What is your most favorite childhood memory?",
          style: .normal
        ),
        .init(
          image: .malteBlur,
          nameAndAge: "Malte, 31",
          question: "What is the most important quality in friendships to you?",
          style: .withTagline
        ),
        .init(
          image: .binghan,
          nameAndAge: "Binghan, 28",
          question: "If you could choose to have one superpower, what would it be?",
          style: .photoGradient
        )
    ]
}
