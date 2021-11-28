//
//  NewsViewModel.swift
//  Investment
//

import SwiftUI

enum NewsDestination {
  case comments, instrument
}

class NewsViewModel: ObservableObject {
  @Published var posts: [Post] = []
  @Published var destination: NewsDestination?
  @Published var instrument: Instrument = Instrument()
  @Published var post: Post = Post()
  @Published var isLinkActive: Bool = false
  
  private let networkService = NetworkService()
  
  init() {
    loadPosts()
  }
  
  func getPost(id: Int) -> Post {
    return posts.first(where: { $0.id == id }) ?? Post()
  }
  
  func showComments(id: Int) {
    self.destination = .comments
    networkService.getPost(id: id) { post in
      self.post = post
      self.isLinkActive = true
    }
  }
  
  func showInstrument(id: Int) {
    self.destination = .instrument
    networkService.getInstrument(id: id) { instrument in
      self.instrument = instrument
      self.isLinkActive = true
    }
  }
  
  private func loadPosts() {
    networkService.getPosts(completion: { posts in
      self.posts = posts.reversed()
    })
  }
}
