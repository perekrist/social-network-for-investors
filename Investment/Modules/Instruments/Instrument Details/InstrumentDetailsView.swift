//
//  InstrumentDetailsView.swift
//  Investment
//

import SwiftUI

struct InstrumentDetailsView: View {
  @ObservedObject var viewModel: InstrumentDetailsViewModel
  
  var body: some View {
    ZStack {
      Color.accentLight.edgesIgnoringSafeArea(.all)
      ScrollView(.vertical) {
        InstrumentView(instrument: viewModel.instrument)
          .padding(4)
        ForEach(viewModel.instrument.blogPosts ?? []) { post in
          PostView(post: post, needShowComments: true, showComments: { id in
            viewModel.showComments(id: id)
          })
        }
        Color.clear.frame(height: 100)
      }
    }.background(
      NavigationLink(isActive: $viewModel.isLinkActive,
                     destination: {
                       CommentsView(viewModel: CommentsViewModel(post: viewModel.post))
                     }, label: {
                       EmptyView()
                     })
        .hidden()
    ).navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .principal) {
            Text("")
              .font(.bold(17))
              .kerning(1.04)
              .foregroundColor(.dark)
              .frame(maxWidth: .infinity, alignment: .leading)
          }
        }
  }
}
