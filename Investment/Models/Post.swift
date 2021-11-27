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
  var comments: [Comment]
  
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

struct Author: Codable, Identifiable {
  let id: Int
  let email: String
  let name: String
  let surname: String
  let isVerified: Bool
  
  init() {
    id = 0
    email = ""
    name = ""
    surname = ""
    isVerified = false
  }
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
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
    text = try container.decodeIfPresent(String.self, forKey: .text) ?? ""
    createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? ""
    blogPostID = try container.decodeIfPresent(Int.self, forKey: .blogPostID)
    authorID = try container.decodeIfPresent(Int.self, forKey: .authorID) ?? 0
    threadComments = try container.decodeIfPresent([Comment].self, forKey: .threadComments)
  }
}
