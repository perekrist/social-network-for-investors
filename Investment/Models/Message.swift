//
//  Message.swift
//  Investment
//

import Foundation

struct Message: Codable, Identifiable, Equatable {
  let id: String = UUID().uuidString
  var authorId: String? = nil
  let text: String
  var date: Date = Date()
  
  var isMyMessage: Bool {
    return authorId == nil || authorId == ""
  }
}
