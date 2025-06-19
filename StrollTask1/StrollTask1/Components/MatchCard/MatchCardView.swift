import SwiftUI

struct MatchCardView: View {
  var image: ImageResource
  var nameAndAge: String
  var question: String
  var hasTagline: Bool = false
  var hasPhoto: Bool = false

  private let cardSize = CGSize(width: 145, height: 205)

  var body: some View {
    ZStack {
      // background
      Image(image)
        .resizable()
        .scaledToFill()
        .frame(width: cardSize.width, height: cardSize.height)
        .clipped()

      // fade‐out gradient when hasPhoto
      if hasPhoto {
        LinearGradient(
          gradient: Gradient(stops: [
            .init(color: .background.opacity(0), location: 0),
            .init(color: .background, location: 0.5),
            .init(color: .background, location: 1),
          ]),
          startPoint: .top,
          endPoint: .bottom
        )
        .frame(height: 145)
        .frame(maxHeight: .infinity, alignment: .bottom)
      }
    }
    .frame(width: cardSize.width, height: cardSize.height)
    .clipShape(RoundedRectangle(cornerRadius: 20))

    // top‐center text badge
    .overlay(
      Group {
        if hasTagline {
          Text("📣 They made a move!")
            .font(.proximaNova(size: 9, weight: .semibold))
            .minimumScaleFactor(0.7)  // for dynamic type to fit in
            .foregroundStyle(.matchBadgeText)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(.matchTagFill)
            .clipShape(Capsule())
            .padding(.top, 11)
        }
      },
      alignment: .top
    )
    // top‐leading emoji badge
    .overlay(
      Group {
        if hasPhoto {
          HStack {
            Text("📣")
              .font(.proximaNova(size: 12))
              .padding(6)
              .background(.matchTagFill)
              .clipShape(Circle())
              .frame(width: 24, height: 24)
            Spacer()

            CountdownCircleView()
          }
          .padding(.top, 9)
          .padding(.horizontal, 9)
        }
      },
      alignment: .top
    )
    // “Tap to answer” at exactly 82 pts from top
    .overlay(
      Group {
        if !hasPhoto {
          Text("Tap to answer")
            .font(.proximaNova(size: 10, weight: .bold))
            .foregroundStyle(.secondaryTitle)
            .frame(maxWidth: .infinity)
            .padding(.top, 82)
        }
      },
      alignment: .top
    )
    // name & question pinned to bottom with 12 pts
    .overlay(
      VStack(spacing: 5) {
        Text(nameAndAge)
          .font(.proximaNova(size: 15, weight: .bold))
          .foregroundStyle(.white)

        Text(question)
          .font(.proximaNova(size: 10))
          .foregroundStyle(.matchQuestion.opacity(0.7))
          .multilineTextAlignment(.center)
          .padding(.horizontal, 15)
      }
        .padding(.bottom, 12),
      alignment: .bottom
    )
  }
}

#Preview {
  MatchCardView(image: .amandaBlur, nameAndAge: "Amanda, 22", question: "What is your most favorite childhood memory?", hasTagline: true)

  MatchCardView(image: .binghan, nameAndAge: "Binghan, 28", question: "What is your most favorite movie childhood memory?", hasPhoto: true)
}
