//
//  InstrumentsViewModel.swift
//  Investment
//

import SwiftUI

enum InstrumentsDestination {
  case details, post
}

class InstrumentsViewModel: ObservableObject {
  @Published var searchText: String = "" {
    didSet {
      if searchText.isEmpty {
        self.instruments = allInstruments
      } else {
        self.instruments = allInstruments.filter({ $0.name.contains(searchText) ||
          $0.description.contains(searchText)
        })
      }
    }
  }
  @Published var instruments: [Instrument] = []
  @Published var allInstruments: [Instrument] = []
  @Published var destination: InstrumentsDestination?
  @Published var post: Post = Post()
  @Published var instrument: Instrument = Instrument()
  @Published var isLinkActive: Bool = false
  private let networkService = NetworkService()
  
  init() {
    loadInstruments()
  }
  
  func showDetails(id: Int) {
    self.destination = .details
    networkService.getInstrument(id: id) { instrument in
      self.instrument = instrument
      self.isLinkActive = true
    }
  }
  
  func showPost(id: Int) {
    self.destination = .post
    networkService.getPost(id: id) { post in
      self.post = post
      self.isLinkActive = true
    }
  }
  
  private func loadInstruments() {
    networkService.getInstruments { instruments in
      self.instruments = instruments
      self.allInstruments = instruments
    }
  }
}
