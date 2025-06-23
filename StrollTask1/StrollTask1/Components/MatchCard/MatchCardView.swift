import SwiftUI

struct MatchCardView: View {
  var image: ImageResource
  var nameAndAge: String
  var question: String
  var hasTagline: Bool = false
  var hasPhoto: Bool = false

  private let cardSize = CGSize(width: 145, height: 205)
  private let cornerRadius: CGFloat = 20

  var body: some View {
    ZStack(alignment: .bottom) {
      // background photo
      Image(image)
        .resizable()
        .scaledToFill()
        .frame(width: cardSize.width, height: cardSize.height)
        .blur(radius: hasPhoto ? 0 : 50, opaque: true)
        .compositingGroup()
        .overlay(
          Color.white.opacity(hasPhoto ? 0 : 0.01)
        )
        .contrast(hasPhoto || image != .amanda ? 1 : 1.8)
        .brightness(hasPhoto || image != .amanda ? 0 : 0.05)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))

      // gradient overlay
      LinearGradient(
        gradient: Gradient(stops: [
          .init(color: .background.opacity(0), location: 0),
          .init(color: .background.opacity(0.8), location: 0.5),
          .init(color: .background, location: 0.7),
          .init(color: .background, location: 1),
        ]),
        startPoint: .top,
        endPoint: .bottom
      )
      .frame(width: cardSize.width, height: 160)
      .opacity(0.98)

      // fix for 'leaking' background in the bottom corners
      RoundedRectangle(cornerRadius: cornerRadius)
        .strokeBorder(Color.background, lineWidth: 1.5)
        .padding(-0.5)
    }
    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    .frame(width: cardSize.width, height: cardSize.height)
    .shadow(color: Color.black.opacity(0.25),
            radius: 4, x: 2, y: 4)

    // top‐center text badge
    .overlay(
      Group {
        if hasTagline {
          Text("📣 They made a move!")
            .font(.proximaNova(size: 9, weight: .semibold))
            .minimumScaleFactor(0.7)  // for dynamic type to fit in
            .foregroundStyle(.matchBadgeText)
            .padding(.horizontal, 10)
            .padding(.vertical, 4.5)
            .background(
              Capsule()
                .fill(Color.matchTagFill)
                .shadow(
                  color: Color(white: 0.5).opacity(0.6), // roughly #808080 @ 60%
                  radius: 15.3,
                  x: 0, y: 0
                )
            )
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
      VStack(spacing: 4) {
        Text(nameAndAge)
          .font(.proximaNova(size: 15, weight: .bold))
          .foregroundStyle(.white)

        Text(question)
          .font(.proximaNova(size: 10))
          .foregroundStyle(.matchQuestion.opacity(0.7))
          .multilineTextAlignment(.center)
          .padding(.horizontal, 15)
      }
        .padding(.bottom, 11),
      alignment: .bottom
    )
  }
}

#Preview {
  MatchCardView(image: .amanda, nameAndAge: "Amanda, 22", question: "What is your most favorite childhood memory?", hasTagline: true)

  MatchCardView(image: .malte,
                nameAndAge: "Malte, 31",
                question: "What is the most important quality in friendships to you?",
                hasTagline: true)

  MatchCardView(image: .binghan, nameAndAge: "Binghan, 28", question: "What is your most favorite movie childhood memory?", hasPhoto: true)
}
