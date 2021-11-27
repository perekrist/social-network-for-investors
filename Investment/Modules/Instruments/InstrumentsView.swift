//
//  InstrumentsView.swift
//  Investment
//

import SwiftUI

struct InstrumentsView: View {
  @ObservedObject var viewModel: InstrumentsViewModel
  
  var body: some View {
    ScrollView(.vertical) {
      ForEach(viewModel.instruments) { instrument in
        InstrumentView(instrument: instrument) {
          viewModel.showDetails(id: instrument.id)
        }.padding(4)
      }
      Color.clear.frame(height: 100)
    }.background(
      NavigationLink(isActive: $viewModel.isLinkActive,
                     destination: {
                       switch viewModel.destination {
                       case .details(let id):
                         InstrumentDetailsView(viewModel: InstrumentDetailsViewModel(instrument: viewModel.getInstrument(id: id)))
                       case .post(let id):
                         CommentsView(viewModel: CommentsViewModel(post: viewModel.getPost(id: id)))
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
