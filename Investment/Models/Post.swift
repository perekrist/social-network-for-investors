//
//  Post.swift
//  Investment
//

import Foundation

struct Post: Codable, Identifiable {
  let id: Int
  let createdAt: String
  let text: String
  let author: Author?
  let instruments: [Instrument]?
  var comments: [Comment]?
  
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
    author = Author()
    instruments = []
    comments = []
  }
}
