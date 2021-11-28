//
//  InstrumentsViewModel.swift
//  Investment
//

import SwiftUI

enum InstrumentsDestination {
  case details(id: Int), post(id: Int)
}

class InstrumentsViewModel: ObservableObject {
  @Published var instruments: [Instrument] = []
  @Published var destination: InstrumentsDestination? {
    didSet {
      self.isLinkActive = true
    }
  }
  @Published var isLinkActive: Bool = false
  private let networkService = NetworkService()
  
  init() {
    loadInstruments()
  }
  
  func showDetails(id: Int) {
    self.destination = .details(id: id)
  }
  
  func getPost(id: Int) -> Post {
    return instruments.flatMap({ $0.blogPosts ?? [] }).first(where: { $0.id == id }) ?? Post()
  }
  
  func getInstrument(id: Int) -> Instrument {
    return instruments.first(where: { $0.id == id }) ?? Instrument()
  }
  
  func showPost(id: Int) {
    self.destination = .post(id: id)
  }
  
  private func loadInstruments() {
    networkService.getInstruments { instruments in
      self.instruments = instruments
    }
  }
}