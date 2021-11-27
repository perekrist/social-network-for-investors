//
//  MessageRow.swift
//  Investment
//

import SwiftUI

struct MessageRow: View {
  let message: Message
  
  var body: some View {
    HStack(alignment: .top, spacing: 8) {
      if message.isMyMessage {
        Spacer()
      }
      TextMessage(isMy: message.isMyMessage, text: message.text, date: message.date)
      if !message.isMyMessage {
        Spacer()
      }
    }
    .padding(.init(top: 8, leading: 12, bottom: 8, trailing: 12))
  }
  
  struct TextMessage: View {
    let isMy: Bool
    let text: String
    let date: Date
    
    var body: some View {
      HStack(alignment: .top, spacing: 0) {
        if !isMy {
          Arrow(isMy: isMy)
        }
        VStack(alignment: .trailing, spacing: 0) {
          Text(text)
            .font(.regular(14))
            .padding(.horizontal, 12)
          Text(date.formatString(isShort: false))
            .font(.medium(8))
            .foregroundColor(.gray2)
        }.padding(.vertical, 7)
          .padding(.horizontal, 4)
          .background(Color.accent.opacity(0.5))
          .clipShape(
            RoundedShape(corners: isMy ? [.topLeft, .bottomLeft, .bottomRight] : [.topRight, .bottomLeft, .bottomRight],
                         radius: 10)
          )
        if isMy {
          Arrow(isMy: isMy)
        }
      }.frame(maxWidth: UIScreen.main.bounds.width - 20, alignment: isMy ? .trailing : .leading)
    }
  }
  
  struct Arrow: View {
    let isMy: Bool
    
    var body: some View {
      Path { path in
        path.move(to: .init(x: isMy ? 0 : 10, y: 20))
        path.addLine(to: .init(x: isMy ? 0 : 10, y: 0))
        path.addLine(to: .init(x: isMy ? 10 : 0, y: 0))
        path.addLine(to: .init(x: isMy ? 0 : 10, y: 20))
      }
      .fill(Color.accent.opacity(0.5))
      .frame(width: 10, height: 30)
    }
  }
  
  struct RoundedShape: Shape {
    var corners: UIRectCorner = [.topLeft, .topRight]
    var radius: CGFloat = 16
    
    func path(in rect: CGRect) -> Path {
      let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners,
                              cornerRadii: CGSize(width: radius, height: radius))
      return Path(path.cgPath)
    }
  }
}

