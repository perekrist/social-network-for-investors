//
//  ContentView.swift
//  Investment
//

import SwiftUI

struct ContentView: View {
  init() {
    UINavigationBar.appearance().backgroundColor = UIColor.accentLight
  }
  
  @State var isLoggedIn: Bool = UserDefaults.standard.value(forKey: "isLoggedIn") as? Bool ?? false
  
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
