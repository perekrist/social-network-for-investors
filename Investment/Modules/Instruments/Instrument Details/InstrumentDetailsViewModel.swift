//
//  InstrumentDetailsViewModel.swift
//  Investment
//

import SwiftUI

class InstrumentDetailsViewModel: ObservableObject {
  @Published var instrument: Instrument
  @Published var post: Post = Post()
  @Published var isLinkActive: Bool = false
  private let networkService = NetworkService()
  
  init(instrument: Instrument) {
    self.instrument = instrument
  }
  
  func showComments(id: Int) {
    getPost(id: id) { post in
      self.post = post
      self.isLinkActive = true
    }
  }
  
  private func getPost(id: Int, completion: @escaping ((Post) -> Void)) {
    networkService.getPost(id: id) { post in
      completion(post)
    }
  }
}

