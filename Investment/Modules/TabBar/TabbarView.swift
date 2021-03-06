//
//  TabbarView.swift
//  Investment
//

import SwiftUI

struct TabbarView: View {
  @ObservedObject private var viewModel = TabbarViewModel()
  
  // tabs
  @ObservedObject private var chatsViewModel = ChatsViewModel()
  @ObservedObject private var instrumentsViewModel = InstrumentsViewModel()
  @ObservedObject private var newsViewModel = NewsViewModel()
  @ObservedObject private var botViewModel = BotViewModel()
  @ObservedObject private var homeViewModel = HomeViewModel()
  
  var body: some View {
    ZStack(alignment: .bottom) {
      VStack {
        switch viewModel.currentTab {
        case .chats:
          ChatsView(viewModel: chatsViewModel)
        case .buy:
          InstrumentsView(viewModel: instrumentsViewModel)
        case .news:
          NewsView(viewModel: newsViewModel)
        case .bot:
          BotView(viewModel: botViewModel)
        case .home:
          HomeView(viewModel: homeViewModel)
        }
      }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.background.edgesIgnoringSafeArea(.all))
      HStack(spacing: 30) {
        ForEach(Tabs.allCases, id: \.self) { tab in
          VStack {
            ZStack(alignment: .center) {
              if tab == .news {
                Circle()
                  .frame(width: 40, height: 40)
                  .foregroundColor(.accent)
              }
              Image(tab.rawValue)
            }
          }.foregroundColor(viewModel.currentTab == tab ? .accent : .neutral)
            .onTapGesture {
              viewModel.currentTab = tab
            }
        }
      }.padding(.vertical, 14)
        .padding(.horizontal, 30)
        .background(Color.white)
        .cornerRadius(99)
        .shadow(color: .dark.opacity(0.3), radius: 10, x: -5, y: -5)
        .shadow(color: .accent.opacity(0.3), radius: 10, x: 5, y: 5)
        .padding(.horizontal, 40)
        .padding(.bottom, 30)
    }.navigationBarHidden(true)
      .edgesIgnoringSafeArea(.bottom)
  }
}
