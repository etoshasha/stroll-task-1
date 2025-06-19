import SwiftUI

struct BackgroundView: View {
  var body: some View {
    ZStack {
      // Background image
      Image("background")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()

      // The linear gradient overlay
      LinearGradient(
        gradient: Gradient(stops: [
          .init(color: .background.opacity(0),
                location: 0.00),
          .init(color: .background,
                location: 0.65),
          .init(color: .background,
                location: 1.00),
        ]),
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()
    }
  }
}

#Preview {
  BackgroundView()
}
