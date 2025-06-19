import SwiftUI

/// Voice message waveform + mic icon + duration
struct VoiceMessageView: View {
  var body: some View {
    HStack(spacing: 11) {
      Image(.microphone)
        .foregroundStyle(
          LinearGradient(
            gradient: Gradient(stops: [
              .init(color: .voiceGradientTop,
                    location: 0.00),
              .init(color: .voiceGradientBottom,
                    location: 1.00)
            ]),
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .frame(height: 17.5)
      Image(.wavelength)
        .foregroundStyle(
          LinearGradient(
            gradient: Gradient(stops: [
              .init(color: .voiceGradientTop,
                    location: 0.00),
              .init(color: .voiceGradientBottom,
                    location: 1.00)
            ]),
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .frame(height: 11.25)
      Text("00:58")
        .font(.proximaNova(size: 14, weight: .bold))
        .foregroundStyle(.voiceGradientTop)
    }
  }
}

#Preview {
    VoiceMessageView()
}
