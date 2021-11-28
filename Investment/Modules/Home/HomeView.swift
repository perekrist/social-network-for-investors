//
//  HomeView.swift
//  Investment
//

import SwiftUI

struct HomeView: View {
  @ObservedObject var viewModel = HomeViewModel()
  
  var body: some View {
    VStack {
      HomeInfoView()
      HomeProfileView(author: viewModel.author)
    }
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
               isOnline: false,
               followers: 0,
               following: 0,
               likes: 0,
               isEditable: false)
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {
    
  }
}
