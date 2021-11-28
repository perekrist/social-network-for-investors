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
      SendView(text: $viewModel.text, placeholder: "Введите комментарий") {
        viewModel.addComment()
      }
    }.navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("Комментарии")
            .font(.bold(17))
            .kerning(1.04)
            .foregroundColor(.dark)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
      }
      .background(
        NavigationLink(isActive: $viewModel.isLinkActive,
                       destination: {
                         switch viewModel.destination {
                         case .comments:
                           ThreadView(viewModel: ThreadViewModel(comment: viewModel.comment))
                         case .instrument:
                           InstrumentDetailsView(viewModel: InstrumentDetailsViewModel(instrument: viewModel.instrument))
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
