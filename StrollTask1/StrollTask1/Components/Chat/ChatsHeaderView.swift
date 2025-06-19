import SwiftUI

 /// Header for "Chats" section
struct ChatsHeaderView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack(alignment: .firstTextBaseline, spacing: 15) {
        VStack(alignment: .leading, spacing: 5) {
          Text("Chats")
            .font(.proximaNova(size: 22, weight: .bold))
            .foregroundStyle(.title)

          Rectangle()
            .fill(.white)
            .frame(width: 50, height: 1)
        }
        Text("Pending")
          .font(.proximaNova(size: 22, weight: .bold))
          .foregroundStyle(.secondaryText)
        Spacer()
      }
      Text("The ice is broken. Time to hit it off")
        .font(.proximaNova(size: 12, weight: .italic))
        .foregroundStyle(.secondaryTitle)

    }
  }
}

#Preview {
  ChatsHeaderView()
}
