//
//  HomeView.swift
//  Investment
//

import SwiftUI

struct HomeView: View {
  @ObservedObject var viewModel = HomeViewModel()
  
  var body: some View {
    VStack {
      ScrollView(.vertical) {
        HomeProfileView(author: viewModel.author)
          .padding()
          .frame(height: 240)
        ForEach(viewModel.author.blogPosts ?? []) { post in
          PostView(post: post, needShowComments: false, showComments: { id in
            viewModel.showPost(id: id)
          }, showInstrument: { id in
            viewModel.showInstrument(id: id)
          })
        }
      }
      Color.clear.frame(height: 100)
    }.background(
      NavigationLink(isActive: $viewModel.isLinkActive,
                     destination: {
                       switch viewModel.destination {
                       case .postDetails:
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

struct HomeInfoView: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let view = UserUpperInfoView()
    view.setup(isSelf: true)
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {}
}

struct HomeProfileView: UIViewRepresentable {
  @State var author: Author
  
  func makeUIView(context: Context) -> UIView {
    let view = ProfileDetailsView()
    view.setup(avatar: nil,
               name: author.name,
               surname: author.surname,
               isOnline: true,
               followers: 0,
               following: author.postsCount,
               likes: author.commentsCount,
               isEditable: false)
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {
    
  }
}
