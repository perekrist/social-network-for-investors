//
//  NewsView.swift
//  Investment
//

import SwiftUI

struct NewsView: View {
  @ObservedObject var viewModel: NewsViewModel
  var body: some View {
    ScrollView(.vertical) {
      ForEach(viewModel.posts) { post in
        VStack(alignment: .leading, spacing: 5) {
          HStack(spacing: 10) {
            Text(post.author.name)
              .font(.bold(30))
            if post.author.isVerified {
              Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
            }
          }
          Text(post.date.fullFormatString())
            .font(.regular(15))
            .foregroundColor(.gray2)
          textWithHashtags(post.text)
            .font(.medium(20))
          ScrollView(.horizontal) {
            ForEach(post.instruments) { instrument in
              VStack(spacing: 8) {
                Text(instrument.ticker)
                  .font(.regular(20))
                  .foregroundColor(.accent)
                Text(instrument.name)
                  .font(.bold(15))
                Text(instrument.description)
                  .font(.regular(15))
                HStack(spacing: 10) {
                  Image(systemName: "arrow.clockwise")
                  Text(instrument.date.fullFormatString())
                    .font(.regular(12))
                }.foregroundColor(.gray2)
              }.padding(4)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .accent.opacity(0.3), radius: 10, x: 4, y: 4)
                .padding(4)
            }
          }
          
        }.padding()
          .frame(maxWidth: .infinity, alignment: .leading)
          .background(Color.white)
          .cornerRadius(10)
          .padding(.horizontal, 10)
          .padding(.vertical, 5)
      }
    }
  }
  
  func textWithHashtags(_ text: String) -> Text {
    let words = text.split(separator: " ")
    var output: Text = Text("")
    
    for word in words {
      if word.hasPrefix("#") {
        output = output + Text(" ") + Text(String(word))
          .foregroundColor(.accent)
      } else if word.hasPrefix("@") {
        output = output + Text(" ") + Text(String(word))
          .foregroundColor(.primary)
      } else {
        output = output + Text(" ") + Text(String(word))
      }
    }
    return output
  }
}
