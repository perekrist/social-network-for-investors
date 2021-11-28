//
//  PostView.swift
//  Investment
//

import SwiftUI

struct PostView: View {
  @State var post: Post
  var needShowComments: Bool = true
  @State var showComments: ((Int) -> ())?
  @State var showInstrument: ((Int) -> ())?
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      if let author = post.author {
        HStack(spacing: 10) {
          Text(author.name)
            .font(.bold(30))
          if author.isVerified == true {
            Image(systemName: "checkmark.circle.fill")
              .foregroundColor(.green)
          }
        }
      }
      Text(post.date.fullFormatString())
        .font(.regular(15))
        .foregroundColor(.gray2)
      textWithHashtags(post.text)
        .font(.medium(20))
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(post.instruments ?? []) { instrument in
            InstrumentView(instrument: instrument) {
              showInstrument?(instrument.id)
            }.frame(maxWidth: UIScreen.main.bounds.width / 2, minHeight: 150)
          }
        }
      }
      if needShowComments {
        Button {
          showComments?(post.id)
        } label: {
          HStack(spacing: 10) {
            Image(systemName: "bubble.left")
            Text("Комментарии:  \((post.comments ?? []).count)")
              .font(.regular(12))
          }.foregroundColor(.gray2)
        }.padding(.top, 10)
      }
      
    }.padding()
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(Color.white)
      .cornerRadius(10)
      .padding(.horizontal, 10)
      .padding(.vertical, 5)
      .onTapGesture {
        guard !needShowComments else { return }
        showComments?(post.id)
      }
  }
  
  private func textWithHashtags(_ text: String) -> Text {
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

