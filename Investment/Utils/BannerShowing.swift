//
//  BannerShowing.swift
//  Investment
//

import Foundation
import NotificationBannerSwift

class BannerShowing {
  static let shared = BannerShowing()
  
  func showInfoBanner(_ text: String) {
    showBanner(text, style: .info)
  }
  
  func showErrorBanner(_ text: String) {
    showBanner(text, style: .danger)
  }
  
  private func showBanner(_ text: String, style: BannerStyle) {
    FloatingNotificationBanner(title: text, style: style).show()
  }
}
