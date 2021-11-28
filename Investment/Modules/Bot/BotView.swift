//
//  BotView.swift
//  Investment
//

import SwiftUI

struct BotView: View {
  @ObservedObject var viewModel: BotViewModel
  
  var body: some View {
    ZStack(alignment: .top) {
      Color.accentLight.edgesIgnoringSafeArea(.all)
      Image("bot-placeholder")
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
      VStack {
        HStack(spacing: 14) {
          Image("bot-icon")
            .resizable()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
          Text("Личный ассистент")
            .font(.bold(16))
            .kerning(0.75)
            .foregroundColor(.dark)
          Spacer()
        }.padding()
        VStack {
          if !viewModel.userMessage.isEmpty {
            MessageRow(message: Message(authorId: nil, text: viewModel.userMessage, date: Date()))
          }
          if !viewModel.botMessage.isEmpty {
            MessageRow(message: Message(authorId: "bot", text: viewModel.botMessage, date: Date()))
          }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        SendView(text: $viewModel.text) {
          viewModel.send()
        }
        Color.clear.frame(height: 100)
      }
    }
  }
}
