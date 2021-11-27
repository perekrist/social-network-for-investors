//
//  CommentsView.swift
//  Investment
//

import SwiftUI

struct CommentsView: View {
  @ObservedObject var viewModel: CommentsViewModel
  
  var body: some View {
    ZStack {
      Color.accentLight.edgesIgnoringSafeArea(.all)
      ScrollView(.vertical) {
        PostView(post: viewModel.post) { _ in
          // do nothing
        } showInstrument: { id in
          viewModel.showInstrument(id: id)
        }
        ForEach(viewModel.post.comments) { comment in
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
            
            if let count = comment.threadComments?.count, count > 0 {
              Button {
                viewModel.showThread(id: comment.id)
              } label: {
                HStack(spacing: 10) {
                  Image(systemName: "bubble.left")
                  Text("Комментарии:  \(count)")
                    .font(.regular(12))
                }.foregroundColor(.gray2)
              }
            }
          }.padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .shadow(color: .shadow2.opacity(0.07),
                    radius: 40, x: 0, y: 10)
            .padding(.top, 1)
        }
      }
    }.navigationBarTitleDisplayMode(.inline)
  }
}
