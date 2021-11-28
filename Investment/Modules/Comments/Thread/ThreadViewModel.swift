//
//  ThreadViewModel.swift
//  Investment
//

import SwiftUI

class ThreadViewModel: ObservableObject {
  @Published var comment: Comment
  @Published var text: String = ""
  private let networkService = NetworkService()
  private let userDefaultsService = UserDefaultsService()
  
  init(comment: Comment) {
    self.comment = comment
  }
  
  func addComment() {
    guard let authorID = userDefaultsService.getUserID() else { return }
    networkService.sendThreadComment(text: text, authorID: authorID,
                                     commentID: comment.id) { comment in
      if self.comment.threadComments == nil {
        self.comment.threadComments = []
      }
      self.comment.threadComments?.append(comment)
      self.text = ""
    }
  }
}


