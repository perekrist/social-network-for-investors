//
//  CommentsView.swift
//  Investment
//

import SwiftUI

struct CommentsView: View {
  @ObservedObject var viewModel: CommentsViewModel
  
  var body: some View {
    ZStack(alignment: .bottom) {
      Color.accentLight.edgesIgnoringSafeArea(.all)
      ScrollView(.vertical) {
        PostView(post: viewModel.post, needShowComments: false) { _ in
          // do nothing
        } showInstrument: { id in
          viewModel.showInstrument(id: id)
        }
        ForEach(viewModel.post.comments ?? []) { comment in
          CommentView(comment: comment, canThread: true) { id in
            viewModel.showThread(id: id)
          }
        }
        Color.clear.frame(height: 100)
      }
      SendView(text: $viewModel.text) {
        viewModel.addComment()
      }
    }.navigationBarTitleDisplayMode(.inline)
      .navigationTitle("Комментарии")
      .background(
        NavigationLink(isActive: $viewModel.isLinkActive,
                       destination: {
                         switch viewModel.destination {
                         case .comments(let id):
                           ThreadView(viewModel: ThreadViewModel(comment: viewModel.getComment(id: id)))
                         case .instrument(let id):
                           EmptyView()
                         default:
                           EmptyView()
                         }
                       }, label: {
                         EmptyView()
                       })
          .hidden()
      )
  }
}
