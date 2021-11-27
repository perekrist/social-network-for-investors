//
//  ContentView.swift
//  Investment
//

import SwiftUI

struct ContentView: View {
  init() {
    UINavigationBar.appearance().backgroundColor = UIColor.accentLight
  }
  
  var body: some View {
    NavigationView {
      TabbarView()
    }.accentColor(.neutral)
  }
}
