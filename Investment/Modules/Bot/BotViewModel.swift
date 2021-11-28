//
//  BotViewModel.swift
//  Investment
//

import SwiftUI

class BotViewModel: ObservableObject {
  @Published var text: String = ""
  @Published var userMessage: String = ""
  @Published var botMessage: String = ""
  
  private let networkService = NetworkService()
  
  func send() {
    self.userMessage = text
    self.botMessage = ""
    self.text = ""
    networkService.sendToBot(text: userMessage) { response in
      self.botMessage = response.text
    }
  }
}
