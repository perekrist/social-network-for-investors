//
//  ThreadViewModel.swift
//  Investment
//

import SwiftUI

class ThreadViewModel: ObservableObject {
  @Published var comment: Comment
  @Published var text: String = ""
  private let networkService = NetworkService()
  
  init(comment: Comment) {
    self.comment = comment
  }
  
  func addComment() {
    networkService.sendThreadComment(text: text, commentID: comment.id) { comment in
      if self.comment.threadComments == nil {
        self.comment.threadComments = []
      }
      self.comment.threadComments?.append(comment)
      self.text = ""
    }
  }
}


