//
//  UserDefaults.swift
//  Investment
//
//  Created by Daniil on 27.11.2021.
//

import Foundation

class CustomUserDefaults {
  private let tokenKey = "tokenKey"
  private let userDefaults = UserDefaults()
  
  func getUserToken() -> String? {
    userDefaults.string(forKey: tokenKey)
  }
  
  func setUserToken(_ token: String) {
    userDefaults.setValue(token, forKey: tokenKey)
  }
  
}
