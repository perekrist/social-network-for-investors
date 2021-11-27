//
//  MessagesView.swift
//  Investment
//

import SwiftUI
import SDWebImageSwiftUI

struct MessagesView: View {
  @ObservedObject var viewModel: MessagesViewModel
  
  var body: some View {
    ZStack(alignment: .top) {
      Color.accentLight.edgesIgnoringSafeArea(.top)
      VStack {
        ScrollView {
          ScrollViewReader { proxy in
            LazyVStack(spacing: 0) {
              ForEach(viewModel.messages) { message in
                if let createdAt = message.date {
                  Text(createdAt.formatString(isShort: true))
                    .foregroundColor(.gray1)
                    .font(.medium(8))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 4)
                }
                MessageRow(message: message)
                  .id(message.id)
              }
            }
            .onChange(of: viewModel.messages) { messages in
              if let lastId = messages.last?.id {
                proxy.scrollTo(lastId)
              }
            }
          }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
          .background(Color.background)
        SendView(text: $viewModel.text) {
          viewModel.sendMessage()
        }
      }
      Rectangle()
        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .top)
        .foregroundColor(.accentLight)
        .edgesIgnoringSafeArea(.top)
    }
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .principal) {
        HStack(spacing: 14) {
          WebImage(url: viewModel.image)
            .resizable()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
          VStack(alignment: .leading, spacing: 0) {
            Text(viewModel.chatName)
              .font(.medium(14))
              .kerning(0.86)
              .foregroundColor(.dark)
            Text("online")
              .font(.medium(12))
              .kerning(1)
              .foregroundColor(.accent)
          }
          Spacer()
        }
      }
    }
  }
}
