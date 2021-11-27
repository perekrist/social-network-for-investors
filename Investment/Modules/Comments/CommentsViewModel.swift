//
//  CommentsViewModel.swift
//  Investment
//

import SwiftUI

class CommentsViewModel: ObservableObject {
  @Published var post: Post
  @Published var text: String = ""
  private let networkService = NetworkService()
  
  init(post: Post) {
    self.post = post
  }
  
  func showThread(id: Int) {
    
  }
  
  func showInstrument(id: Int) {
    
  }
  
  func addComment() {
    networkService.sendComment(text: text, blogPostID: post.id) { comment in
      self.text = ""
      self.post.comments.append(comment)
    }
  }
}
