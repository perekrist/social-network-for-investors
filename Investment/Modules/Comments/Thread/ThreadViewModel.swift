//
//  ThreadViewModel.swift
//  Investment
//

import SwiftUI

class ThreadViewModel: ObservableObject {
  @Published var comment: Comment
  
  init(comment: Comment) {
    self.comment = comment
  }
}


