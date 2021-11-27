//
//  Font+Custom.swift
//  Investment
//

import SwiftUI

extension UIFont {
  static func bold(_ size: CGFloat) -> UIFont? {
    UIFont(name: "Poppins-Bold", size: size)
  }
  
  static func medium(_ size: CGFloat) -> UIFont? {
    UIFont(name: "Poppins-Medium", size: size)
  }
  
  static func regular(_ size: CGFloat) -> UIFont? {
    UIFont(name: "Poppins-Regular", size: size)
  }
}

extension Font {
  static func bold(_ size: CGFloat) -> Font? {
    Font.custom("Poppins-Bold", size: size)
  }
  
  static func medium(_ size: CGFloat) -> Font? {
    Font.custom("Poppins-Medium", size: size)
  }
  
  static func regular(_ size: CGFloat) -> Font? {
    Font.custom("Poppins-Regular", size: size)
  }
}
