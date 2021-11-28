//
//  InstrumentsView.swift
//  Investment
//

import SwiftUI

struct InstrumentsView: View {
  @ObservedObject var viewModel: InstrumentsViewModel
  
  var body: some View {
    VStack {
      TextField("Поиск акций", text: $viewModel.searchText)
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.white)
        )
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .stroke(Color.gray2, lineWidth: 1)
        ).padding(.horizontal, 10)
      ScrollView(.vertical) {
        ForEach(viewModel.instruments) { instrument in
          InstrumentView(instrument: instrument) {
            viewModel.showDetails(id: instrument.id)
          }.padding(4)
        }
        Color.clear.frame(height: 100)
      }
    }.background(
      NavigationLink(isActive: $viewModel.isLinkActive,
                     destination: {
                       switch viewModel.destination {
                       case .details:
                         InstrumentDetailsView(viewModel: InstrumentDetailsViewModel(instrument: viewModel.instrument))
                       case .post:
                         CommentsView(viewModel: CommentsViewModel(post: viewModel.post))
                       default:
                         EmptyView()
                       }
                     }, label: {
                       EmptyView()
                     })
        .hidden()
    )
  }
}
