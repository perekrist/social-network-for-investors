//
//  Instrument.swift
//  Investment
//

import Foundation

struct Instrument: Codable, Identifiable {
  let id: Int
  let createdAt: String
  let ticker: String
  let name: String
  let description: String
  let instrumentTypeID: Int
  let instrumentType: InstrumentType?
  let blogPosts: [Post]?
  
  var date: Date {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    return dateFormatter.date(from: createdAt) ?? Date()
  }
}

struct InstrumentType: Codable, Identifiable {
  let id: Int
  let name: String
}
