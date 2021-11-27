//
//  ChatsViewModel.swift
//  Investment
//

import SwiftUI

class ChatsViewModel: ObservableObject {
  @Published var chats: [Chat] = []
  @Published var shouldShowMessagesScreen: Bool = false
  @Published var messagesViewModel: MessagesViewModel?
  
  init() {
    getChats()
  }
  
  func selectChat(_ id: String) {
    guard let chat: Chat = chats.first(where: { $0.id == id }) else { return }
    messagesViewModel = MessagesViewModel(chatName: chat.name, image: chat.url)
    shouldShowMessagesScreen = true
  }
  
  private func getChats() {
    self.chats = [Chat(name: "Андрей Иванов", lastMessage: "Привет!", unreadMessages: 2),
                  Chat(name: "Борис Савельев", lastMessage: "Хороший пост..."),
                  Chat(name: "Артем Кошкин", lastMessage: "Жду ответа", unreadMessages: 3),
                  Chat(name: "Анастасия Козлова", lastMessage: "Добро пожаловать!"),
                  Chat(name: "Дмитрий Тетерев", lastMessage: "Привет!"),
                  Chat(name: "Андрей Иванов", lastMessage: "Привет!", unreadMessages: 2),
                  Chat(name: "Артем Кошкин", lastMessage: "Жду ответа", unreadMessages: 3),
                  Chat(name: "Борис Савельев", lastMessage: "Хороший пост..."),
                  Chat(name: "Анастасия Козлова", lastMessage: "Добро пожаловать!"),
                  Chat(name: "Дмитрий Тетерев", lastMessage: "Привет!"),
                  Chat(name: "Андрей Иванов", lastMessage: "Привет!", unreadMessages: 2),
                  Chat(name: "Борис Савельев", lastMessage: "Хороший пост..."),
                  Chat(name: "Артем Кошкин", lastMessage: "Жду ответа", unreadMessages: 3),
                  Chat(name: "Анастасия Козлова", lastMessage: "Добро пожаловать!"),
                  Chat(name: "Дмитрий Тетерев", lastMessage: "Привет!"),
                  Chat(name: "Андрей Иванов", lastMessage: "Привет!", unreadMessages: 2),
                  Chat(name: "Борис Савельев", lastMessage: "Хороший пост..."),
                  Chat(name: "Артем Кошкин", lastMessage: "Жду ответа", unreadMessages: 3),
                  Chat(name: "Анастасия Козлова", lastMessage: "Добро пожаловать!"),
                  Chat(name: "Дмитрий Тетерев", lastMessage: "Привет!")]
  }
}
