//
//  ThreadView.swift
//  Investment
//

import SwiftUI

struct ThreadView: View {
  @ObservedObject var viewModel: ThreadViewModel
  
  var body: some View {
    ZStack(alignment: .bottom) {
      Color.accentLight.edgesIgnoringSafeArea(.all)
      ScrollView(.vertical) {
        CommentView(comment: viewModel.comment, canThread: false)
        ForEach(viewModel.comment.threadComments ?? []) { comment in
          CommentView(comment: comment, canThread: false)
        }
      }
      SendView(text: $viewModel.text) {
        viewModel.addComment()
      }
    }.navigationTitle("Вложенные комментарии")
  }
}
