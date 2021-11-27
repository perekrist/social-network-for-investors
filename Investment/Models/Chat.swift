//
//  Chat.swift
//  Investment
//

import Foundation

struct Chat: Codable, Identifiable {
  let id: String = UUID().uuidString
  let name: String
  var image: String? = "https://avatars.githubusercontent.com/u/47295673?s=48&v=4"
  var lastMessage: String? = nil
  var unreadMessages: Int = 0
  
  var hasUnreadMessages: Bool {
    return unreadMessages > 0
  }
  
  var url: URL? {
    guard let image = image else { return nil }
    return URL(string: image)
  }
}
