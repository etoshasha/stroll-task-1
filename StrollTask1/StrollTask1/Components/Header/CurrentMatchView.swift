import SwiftUI

/// Circular match icon + “90” badge below
struct CurrentMatchView: View {
    var body: some View {
      ZStack {
        Image(.ellipseBack)
        Image(.ellipseFront)
          .offset(y: -1)
        Image(.match)
          .clipShape(Circle())
          .frame(width: 35.36)
          .offset(y: 5)
          .shadow(color: .accent.opacity(0.6), radius: 15)
        Image(.ellipseLine)
          .offset(x: 21, y: 5)
        Text("90")
          .font(.interBold(size: 10.8))
          .foregroundStyle(.matchBadgeText)
          .padding(.horizontal, 13.5)
          .padding(.vertical, 2.7)
          .background(.matchBadgeFill)
          .clipShape(.capsule)
          .offset(y: 25)
      }
      .frame(width: 44.37)
    }
}

#Preview {
    CurrentMatchView()
}
