import SwiftUI

/// Horizontal scroll of three MatchCardView
struct MatchCardsSectionView: View {
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 15) {
        Rectangle().fill(.clear).frame(width: 2) // default clear space before first card
        ForEach(MatchCardConfig.all) { cfg in
          MatchCardView(
              image:      cfg.image,
              nameAndAge: cfg.nameAndAge,
              question:   cfg.question,
              hasTagline: cfg.style == .withTagline,
              hasPhoto:   cfg.style == .photoGradient
            )
        }
        CollapsedCardsView()
        Rectangle().fill(.clear).frame(width: 2) // default clear space after last card
      }
      .padding(.top, 20)
      .padding(.bottom, 29)
    }
  }
}

#Preview {
  MatchCardsSectionView()
}
