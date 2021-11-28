//
//  NewsView.swift
//  Investment
//

import SwiftUI

struct NewsView: View {
  @ObservedObject var viewModel: NewsViewModel
  var body: some View {
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
