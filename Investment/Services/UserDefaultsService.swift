//
//  UserDefaultsService.swift
//  Investment
//

import Foundation

class UserDefaultsService {
  private let tokenKey = "tokenKey"
  private let userDefaults = UserDefaults()
  
  func getUserToken() -> String? {
    userDefaults.string(forKey: tokenKey)
  }
  
  func setUserToken(_ token: String) {
    userDefaults.setValue(token, forKey: tokenKey)
  }
}
