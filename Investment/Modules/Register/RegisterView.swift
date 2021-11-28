//
//  LoginView.swift
//  Investment
//

import SwiftUI

struct RegisterView: UIViewControllerRepresentable {
  @Binding var isLoggedIn: Bool
  
  func makeUIViewController(context: Context) -> UIViewController {
    let viewController = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
    viewController.onDidAuthorize = {
      isLoggedIn = true
    }
    return viewController
  }
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    guard let viewController = uiViewController as? RegisterViewController else { return }
    viewController.onDidAuthorize = {
      isLoggedIn = true
    }
  }
}
