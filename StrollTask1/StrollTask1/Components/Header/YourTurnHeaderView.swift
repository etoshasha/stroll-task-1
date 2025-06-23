import SwiftUI

/// Top “Your Turn” title + badge + subtitle + CurrentMatchView
struct YourTurnHeaderView: View {
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 6) {
        HStack(spacing: 10.5) {
          Text("Your Turn")
            .font(.proximaNova(size: 22, weight: .bold))
            .foregroundStyle(.title)
          Text("7")
            .font(.proximaNova(size: 10, weight: .bold))
            .foregroundStyle(.yourTurnBadge)
            .padding(.horizontal, 5)
            .padding(.vertical, 2)
            .background(.yourTurnBadgeFill)
            .clipShape(Circle())
        }
        Text("Make your move, they are waiting 🎵")
          .font(.proximaNova(size: 12, weight: .italic))
          .foregroundStyle(.secondaryTitle)
      }
      Spacer()
      CurrentMatchView()
        .offset(x: 1, y: -8.5)
    }
  }
}

#Preview {
  YourTurnHeaderView()
}
