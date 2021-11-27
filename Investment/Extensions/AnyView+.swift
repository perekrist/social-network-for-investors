//
//  AnyView+.swift
//  Investment
//

import SwiftUI

extension AnyView{
  static func + (left: AnyView, right: AnyView) -> AnyView {
    return AnyView(
      VStack {
        left.fixedSize(horizontal: true, vertical: false)
        right.fixedSize(horizontal: true, vertical: false)
      }
    )
  }
}
