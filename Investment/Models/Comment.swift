//
//  Comment.swift
//  Investment
//

import Foundation

struct Comment: Codable, Identifiable {
  let id: Int
  let createdAt: String
  let text: String
  let blogPostID: Int?
  let authorID: Int
  var threadComments: [Comment]?
  
  var date: Date {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    return dateFormatter.date(from: createdAt) ?? Date()
  }
  
  init() {
    id = 0
    createdAt = ""
    text = ""
    blogPostID = nil
    authorID = 0
    threadComments = nil
  }
}
