//
//  AuthResult.swift
//  Investment
//

import Foundation

struct AuthResult: Decodable {
  var message: String?
  var status: Bool?
  var token: String?
  var user_id: Int?
}
