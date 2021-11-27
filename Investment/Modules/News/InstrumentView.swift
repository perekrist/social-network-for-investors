//
//  InstrumentView.swift
//  Investment
//

import SwiftUI

struct InstrumentView: View {
  var instrument: Instrument
  var onTap: (() -> ())
  
  var body: some View {
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
      .onTapGesture {
        onTap()
      }
  }
}
