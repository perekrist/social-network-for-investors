//
//  MessagesViewModel.swift
//  Investment
//

import SwiftUI

class MessagesViewModel:ObservableObject {
  @Published var text: String = ""
  @Published var chatName: String
  @Published var image: URL?
  @Published var messages: [Message] = []
  
  init(chatName: String, image: URL?) {
    self.chatName = chatName
    self.image = image
    getMessages()
  }
  
  func sendMessage() {
    guard !text.isEmpty else { return }
    self.messages.append(Message(text: text))
    self.text = ""
  }
  
  private func getMessages() {
    self.messages = [Message(text: "Добрый день!"),
                     Message(authorId: "help", text: "Добрый день!")]
  }
}
