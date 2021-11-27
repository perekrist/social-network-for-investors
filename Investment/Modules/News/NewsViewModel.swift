//
//  NewsViewModel.swift
//  Investment
//

import SwiftUI

enum NewsDestination {
  case comments(id: Int), instrument(id: Int)
}

class NewsViewModel: ObservableObject {
  @Published var posts: [Post] = []
  @Published var destination: NewsDestination? {
    didSet {
      self.isLinkActive = true
    }
  }
  @Published var isLinkActive: Bool = false
  
  private let networkService = NetworkService()
  
  init() {
    loadPosts()
  }
  
  func getPost(id: Int) -> Post {
    return posts.first(where: { $0.id == id }) ?? Post()
  }
  
  func showComments(id: Int) {
    self.destination = .comments(id: id)
  }
  
  func showInstrument(id: Int) {
    self.destination = .instrument(id: id)
  }
  
  private func loadPosts() {
    networkService.getPosts(completion: { posts in
      self.posts = posts.reversed()
    })
  }
}
