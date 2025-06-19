import SwiftUI

struct CollapsedCardsView: View {
    var body: some View {
      ZStack {
        RoundedRectangle(cornerRadius: 20)
          .fill(.collapsedCards)

        Image(.collapsed3)
          .offset(x: 20)
          .frame(height: 18)
        Image(.collapsed2)
          .offset(x: 8)
          .frame(height: 18)
        Image(.collapsed1)
          .offset(x: -4)
          .frame(height: 18)

        Text("+10")
          .font(.proximaNova(size: 10, weight: .bold))
          .foregroundStyle(.white)
          .padding(.horizontal, 5)
          .padding(.vertical, 3.5)
          .background(.black)
          .clipShape(.capsule)
          .offset(x: -20)
      }
      .frame(width: 90, height: 205)
    }
}

#Preview {
    CollapsedCardsView()
}
