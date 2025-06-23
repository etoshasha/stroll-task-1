import SwiftUI

/// Circular match icon + “90” badge below
struct CurrentMatchView: View {
    var body: some View {
      ZStack {
        Image(.ellipseBack)
        Image(.ellipseFront)
          .offset(y: -0.5)
        Image(.match)
          .clipShape(Circle())
          .frame(width: 35.36)
          .offset(y: 5)
          .shadow(color: .accent.opacity(0.5), radius: 12)
        Image(.ellipseLine)
          .offset(x: 21, y: 5.3)
        Text("90")
          .font(.interBold(size: 10.8))
          .fontWeight(.bold)
          .foregroundStyle(.matchBadgeText)
          .padding(.horizontal, 13.5)
          .padding(.vertical, 2.7)
          .background(.matchBadgeFill)
          .clipShape(.capsule)
          .offset(y: 27)
      }
      .frame(width: 44.37)
    }
}

#Preview {
    CurrentMatchView()
}
