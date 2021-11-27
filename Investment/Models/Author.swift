//
//  Author.swift
//  Investment
//

import Foundation

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
