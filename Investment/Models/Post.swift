//
//  Post.swift
//  Investment
//

import Foundation

struct Post: Codable, Identifiable {
  let id: Int
  let createdAt: String
  let text: String
  let author: Author
  let instruments: [Instrument]
  let comments: [Comment]
  
  var date: Date {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    return dateFormatter.date(from: createdAt) ?? Date()
  }
}

struct Author: Codable, Identifiable {
  let id: Int
  let email: String
  let name: String
  let surname: String
  let isVerified: Bool
}

struct Instrument: Codable, Identifiable {
  let id: Int
  let createdAt: String
  let ticker: String
  let name: String
  let description: String
  let instrumentTypeID: Int
  
  var date: Date {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    return dateFormatter.date(from: createdAt) ?? Date()
  }
}

struct Comment: Codable, Identifiable {
  let id: Int
  let createdAt: String
  let text: String
  let blogPostID: Int?
  let authorID: Int
  let threadComments: [Comment]?
  
  var date: Date {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    return dateFormatter.date(from: createdAt) ?? Date()
  }
}
