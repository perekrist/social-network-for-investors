//
//  NewsViewModel.swift
//  Investment
//

import SwiftUI

class NewsViewModel: ObservableObject {
  @Published var posts: [Post] = []
  
  private let networkService = NetworkService()
  
  init() {
    loadPosts()
  }
  
  private func loadPosts() {
    networkService.getPosts(completion: { posts in
      self.posts = posts.reversed()
    })
  }
}
