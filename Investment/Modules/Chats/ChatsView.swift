//
//  ChatsView.swift
//  Investment
//

import SwiftUI
import SDWebImageSwiftUI

struct ChatsView: View {
  @ObservedObject var viewModel: ChatsViewModel
  
  var body: some View {
    VStack {
      HStack {
        Text("Сообщения")
          .foregroundColor(.neutral)
          .font(.bold(18))
          .kerning(1.04)
        Spacer()
        HStack(spacing: 18) {
          Button {
            // search
          } label: {
            Image(systemName: "magnifyingglass")
              .resizable()
              .frame(width: 20, height: 20)
              .foregroundColor(.accent)
          }
          
          Button {
            // add
          } label: {
            Image(systemName: "plus")
              .resizable()
              .frame(width: 20, height: 20)
              .foregroundColor(.accent)
          }
        }
      }.padding([.top, .trailing, .bottom], 21)
        .padding(.leading, 25)
      
      ScrollView(.vertical) {
        VStack(spacing: 6) {
          ForEach(viewModel.chats) { chat in
            let hasMessages = chat.hasUnreadMessages
            HStack(spacing: 10) {
              WebImage(url: chat.url)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(20)
                .shadow(color: .shadow.opacity(0.2), radius: 20, x: 0, y: 4)
              VStack(alignment: .leading, spacing: 5) {
                Text(chat.name)
                  .font(.medium(14))
                  .kerning(0.86)
                  .foregroundColor(.dark)
                Text(chat.lastMessage ?? "")
                  .font(.medium(12))
                  .kerning(1)
                  .foregroundColor(.gray1)
              }
              Spacer()
              if hasMessages {
                Text("\(chat.unreadMessages)")
                  .foregroundColor(.white)
                  .font(.medium(12))
                  .background(
                    Circle()
                      .frame(width: 25, height: 25)
                      .foregroundColor(.accent)
                  )
              }
            }.padding(.top, 12)
              .padding(.bottom, 8)
              .padding(.horizontal, 30)
              .background(hasMessages ? Color.white : Color.clear)
              .shadow(color: hasMessages ? .shadow2.opacity(0.07): .clear,
                      radius: hasMessages ? 40 : 0,
                      x: 0, y: hasMessages ? 10 : 0)
              .onTapGesture {
                viewModel.selectChat(chat.id)
              }
              .id(chat.id)
          }
        }
        Color.clear.frame(height: 100)
      }
    }.background(
      NavigationLink(isActive: $viewModel.shouldShowMessagesScreen,
                     destination: {
                       if let messagesViewModel = viewModel.messagesViewModel {
                         MessagesView(viewModel: messagesViewModel)
                       } else {
                         EmptyView()
                       }
                     }, label: {
                       EmptyView()
                     })
        .hidden()
    )
  }
}
