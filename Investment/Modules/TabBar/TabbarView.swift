//
//  TabbarView.swift
//  Investment
//

import SwiftUI

struct TabbarView: View {
  @ObservedObject private var viewModel = TabbarViewModel()
  
  var body: some View {
    ZStack(alignment: .bottom) {
      VStack {
        switch viewModel.currentTab {
        case .chats:
          Text("Chats")
        case .buy:
          Text("Buy")
        case .news:
          Text("News")
        case .bot:
          Text("Bot")
        case .home:
          Text("Home")
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
          }.foregroundColor(viewModel.currentTab == tab ? .accent : .gray2)
            .onTapGesture {
              viewModel.currentTab = tab
            }
        }
      }.padding(.vertical, 14)
        .padding(.horizontal, 30)
        .background(Color.white)
        .cornerRadius(99)
        .padding(.horizontal, 40)
        .padding(.bottom, 30)
    }.navigationBarHidden(true)
      .edgesIgnoringSafeArea(.bottom)
  }
}
