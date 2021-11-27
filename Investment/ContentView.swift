//
//  ContentView.swift
//  Investment
//

import SwiftUI

struct ContentView: View {
  init() {
    UINavigationBar.appearance().backgroundColor = UIColor.accentLight
  }
  
  private var isLoggedIn: Bool {
    return UserDefaultsService().getUserToken() != nil
  }
  
  var body: some View {
    NavigationView {
      if isLoggedIn {
        TabbarView()
      } else {
        LoginView()
          .navigationBarHidden(true)
      }
    }.accentColor(.neutral)
  }
}
