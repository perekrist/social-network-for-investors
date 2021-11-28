//
//  CreatePostView.swift
//  Investment
//

import SwiftUI

struct CreatePostView: UIViewControllerRepresentable {
  @Binding var isPresented: Bool
  
  func makeUIViewController(context: Context) -> UIViewController {
    let viewController = CreatePostViewController(nibName: "CreatePostViewController", bundle: nil)
    viewController.onDidCreatePost = {
      isPresented = false
    }
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    guard let viewController = uiViewController as? CreatePostViewController else { return }
    viewController.onDidCreatePost = {
      isPresented = false
    }
  }
}
