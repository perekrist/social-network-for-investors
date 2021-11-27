//
//  SendView.swift
//  Investment
//

import SwiftUI

struct SendView: View {
  @Binding var text: String
  @State var onSendMessage: (() -> ())
  
  var body: some View {
    HStack(spacing: 20) {
      TextField("Введите сообщение", text: $text)
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.white)
        )
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .stroke(Color.gray2, lineWidth: 1)
        )
      Button {
        onSendMessage()
      } label: {
        Image("send")
          .background(
            Circle()
              .frame(width: 40, height: 40)
              .foregroundColor(.accent)
          )
      }
    }.padding(.horizontal, 20)
      .padding(.vertical, 10)
      .frame(maxWidth: .infinity)
      .background(Color.accentLight.edgesIgnoringSafeArea(.bottom))
  }
}
