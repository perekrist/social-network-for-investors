//
//  Color+Custom.swift
//  Investment
//

import SwiftUI

extension UIColor {
  static let accent = UIColor(red: 0.255, green: 0.761, blue: 0.902, alpha: 1)
  static let dark = UIColor(red: 0.115, green: 0.085, blue: 0.09, alpha: 1)
  static let gray2 = UIColor(red: 0.677, green: 0.643, blue: 0.649, alpha: 1)
  static let primary = UIColor(red: 1, green: 0, blue: 0.36, alpha: 1)
}

extension Color {
  static let accent = Color(UIColor.accent)
  static let dark = Color(UIColor.dark)
  static let gray2 = Color(UIColor.gray2)
  static let primary = Color(UIColor.primary)
}
