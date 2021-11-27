//
//  TabbarViewModel.swift
//  Investment
//

import SwiftUI

enum Tabs: String, CaseIterable {
  case chats, buy, news, bot, home
}

class TabbarViewModel: ObservableObject {
  @Published var currentTab: Tabs = .chats
}
