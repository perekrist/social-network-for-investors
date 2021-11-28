//
//  UserDefaultsService.swift
//  Investment
//

import Foundation

class UserDefaultsService {
  private let tokenKey = "tokenKey"
  private let idKey = "idKey"
  
  private let userDefaults = UserDefaults()
  
  func getUserToken() -> String? {
    userDefaults.string(forKey: tokenKey)
  }
  
  func setUserToken(_ token: String) {
    userDefaults.setValue(token, forKey: tokenKey)
  }
  
  func getUserID() -> Int? {
    userDefaults.integer(forKey: idKey)
  }
  
  func setUserID(_ id: Int) {
    userDefaults.setValue(id, forKey: idKey)
  }
  
  func clearAll() {
    userDefaults.setValue(nil, forKey: tokenKey)
    userDefaults.setValue(nil, forKey: idKey)
  }
}
