//
//  HomeViewModel.swift
//  Investment
//

import SwiftUI

class HomeViewModel: ObservableObject {
  @Published var author: Author = Author()
  
  private let networkService = NetworkService()
  private let userDefaultsService = UserDefaultsService()
  
  init() {
    getAuthor()
  }
  
  func getAuthor() {
    guard let id = userDefaultsService.getUserID() else { return }
    networkService.getAuthor(id: id) { author in
      self.author = author
    }
  }
}
