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
  
  var date: Date {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    return dateFormatter.date(from: createdAt) ?? Date()
  }
}
