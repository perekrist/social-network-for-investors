//
//  CommentsViewModel.swift
//  Investment
//

import SwiftUI

class CommentsViewModel: ObservableObject {
  @Published var post: Post
  @Published var text: String = ""
  @Published var destination: NewsDestination? {
    didSet {
      self.isLinkActive = true
    }
  }
  @Published var isLinkActive: Bool = false
  
  private let networkService = NetworkService()
  
  init(post: Post) {
    self.post = post
  }
  
  func getComment(id: Int) -> Comment {
    return post.comments?.first(where: { $0.id == id }) ?? Comment()
  }
  
  func showThread(id: Int) {
    self.destination = .comments(id: id)
  }
  
  func showInstrument(id: Int) {
    self.destination = .instrument(id: id)
  }
  
  func addComment() {
    networkService.sendComment(text: text, blogPostID: post.id) { comment in
      self.text = ""
      self.post.comments?.append(comment)
    }
  }
}
