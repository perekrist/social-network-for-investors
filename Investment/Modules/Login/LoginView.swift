//
//  LoginView.swift
//  Investment
//

import SwiftUI

struct LoginView: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> UIViewController {
    return LoginViewController(nibName: "LoginViewController", bundle: nil)
  }
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    
  }
}
