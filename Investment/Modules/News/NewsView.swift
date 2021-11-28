//
//  NewsView.swift
//  Investment
//

import SwiftUI

struct NewsView: View {
  @ObservedObject var viewModel: NewsViewModel
  var body: some View {
    ZStack(alignment: .topTrailing) {
      ScrollView(.vertical) {
        ForEach(viewModel.posts) { post in
          PostView(post: post) { id in
            viewModel.showComments(id: id)
          } showInstrument: { id in
            viewModel.showInstrument(id: id)
          }
        }
        Color.clear.frame(height: 100)
      }
      
      Button {
        viewModel.shouldCreatePost.toggle()
      } label: {
        Image(systemName: "plus")
          .foregroundColor(.white)
          .background(
            Circle()
              .frame(width: 40, height: 40)
              .foregroundColor(.accent)
          )
      }.padding(20)
    }.sheet(isPresented: $viewModel.shouldCreatePost) {
      CreatePostView(isPresented: $viewModel.shouldCreatePost)
    }
    .background(
      NavigationLink(isActive: $viewModel.isLinkActive,
                     destination: {
                       switch viewModel.destination {
                       case .comments:
                         CommentsView(viewModel: CommentsViewModel(post: viewModel.post))
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
