//
//  CommentsViewModel.swift
//  Investment
//

import SwiftUI

class CommentsViewModel: ObservableObject {
  @Published var post: Post
  @Published var instrument: Instrument = Instrument()
  @Published var comment: Comment = Comment()
  @Published var text: String = ""
  @Published var destination: NewsDestination?
  @Published var isLinkActive: Bool = false
  
  private let networkService = NetworkService()
  private let userDefaultsService = UserDefaultsService()
  
  init(post: Post) {
    self.post = post
  }
  
  func showThread(id: Int) {
    self.destination = .comments
    networkService.getComment(id: id) { comment in
      self.comment = comment
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
  
  func addComment() {
    guard let authorID = userDefaultsService.getUserID() else { return }
    networkService.sendComment(text: text, authorID: authorID,
                               blogPostID: post.id) { comment in
      self.text = ""
      if self.post.comments == nil {
        self.post.comments = []
      }
      self.post.comments?.append(comment)
    }
  }
}
