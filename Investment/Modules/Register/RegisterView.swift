//
//  LoginView.swift
//  Investment
//

import SwiftUI

struct RegisterView: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> UIViewController {
    return RegisterViewController(nibName: "RegisterViewController", bundle: nil)
  }
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
