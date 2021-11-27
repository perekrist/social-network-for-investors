//
//  CommentView.swift
//  Investment
//

import SwiftUI

struct CommentView: View {
  @State var comment: Comment
  let canThread: Bool
  var showThread: ((Int) -> ())?
  
  var body: some View {
    VStack(alignment: .leading) {
      VStack(alignment: .leading) {
        Text("\(comment.authorID)")
          .font(.bold(15))
          .foregroundColor(.dark)
        Text(comment.text)
          .font(.regular(20))
          .foregroundColor(.dark)
        Text(comment.date.fullFormatString())
          .font(.regular(15))
          .foregroundColor(.gray2)
      }
      if canThread {
        let count = comment.threadComments?.count ?? 0
        Button {
          showThread?(comment.id)
        } label: {
          HStack(spacing: 10) {
            Image(systemName: "bubble.left")
            Text("Комментарии:  \(count)")
              .font(.regular(12))
          }.foregroundColor(.gray2)
        }.padding(.vertical, 2)
      }
    }.padding(.horizontal)
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(Color.white)
      .shadow(color: .shadow2.opacity(0.07),
              radius: 40, x: 0, y: 10)
      .padding(.top, 1)
  }
}
