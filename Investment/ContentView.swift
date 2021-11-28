//
//  ContentView.swift
//  Investment
//

import SwiftUI

struct ContentView: View {
  init() {
    UINavigationBar.appearance().backgroundColor = UIColor.accentLight
  }
  
  @State private var isLoggedIn: Bool = false
  private let userDefaultsService = UserDefaultsService()
  
  var body: some View {
    NavigationView {
      if isLoggedIn {
        TabbarView()
      } else {
        RegisterView(isLoggedIn: $isLoggedIn)
          .navigationBarHidden(true)
      }
    }.onAppear {
      self.isLoggedIn = userDefaultsService.getUserToken() != nil
    }
    .accentColor(.neutral)
  }
}
