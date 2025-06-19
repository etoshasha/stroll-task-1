import SwiftUI

/// Small progress circle with glowing shadow and center “16h”
struct CountdownCircleView: View {
  var progress: Double = 16/24
  var backgroundCircleColor: Color = Color.white.opacity(0.15)
  var progressColor: Color = Color.white.opacity(0.8)

  var body: some View {
    ZStack {
      // outer glow
      Circle()
        .fill(Color.black.opacity(0.7))
        .frame(width: 24.8, height: 24.8)
        .shadow(color: .black,
                radius: 8)
        .shadow(color: .black.opacity(0.9),
                radius: 4)
        .shadow(color: .black.opacity(0.6),
                radius: 8)
        .shadow(color: .black.opacity(0.3),
                radius: 16)

      // inner background
      Circle()
        .fill(backgroundCircleColor)
        .frame(width: 19.2, height: 19.2)

      // progress ring
      Circle()
        .trim(from: 0, to: CGFloat(progress))
        .stroke(style: StrokeStyle(lineWidth: 1.2, lineCap: .round))
        .foregroundColor(progressColor)
        .frame(width: 19.2, height: 19.2)
        .rotationEffect(.degrees(-90))
        .shadow(color: .black.opacity(0.5), radius: 1)

      // center label
      Text("16h")
        .font(.proximaNova(size: 6.2, weight: .bold))
        .foregroundColor(progressColor)
    }
    .frame(width: 24.8, height: 24.8)
  }
}

#Preview {
  CountdownCircleView()
}
