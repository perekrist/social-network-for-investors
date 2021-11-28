//
//  HomeViewModel.swift
//  Investment
//

import SwiftUI

enum HomeDestination {
  case postDetails(id: Int), instrument(id: Int)
}

class HomeViewModel: ObservableObject {
  @Published var author: Author = Author()
  @Published var destination: HomeDestination?
  @Published var isLinkActive: Bool = false
  
  @Published var post: Post = Post()
  @Published var instrument: Instrument = Instrument()
  
  private let networkService = NetworkService()
  private let userDefaultsService = UserDefaultsService()
  
  init() {
    getAuthor()
  }
  
  func showPost(id: Int) {
    self.destination = .postDetails(id: id)
    networkService.getPost(id: id) { post in
      self.post = post
      self.isLinkActive = true
    }
  }
  
  func showInstrument(id: Int) {
    self.destination = .instrument(id: id)
    networkService.getInstrument(id: id) { instrument in
      self.instrument = instrument
      self.isLinkActive = true
    }
  }
  
  private func getAuthor() {
    guard let id = userDefaultsService.getUserID() else { return }
    networkService.getAuthor(id: id) { author in
      self.author = author
    }
  }
}
