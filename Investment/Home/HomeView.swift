//
//  HomeView.swift
//  Investment
//

import SwiftUI

struct HomeView: UIViewControllerRepresentable {
  @ObservedObject var viewModel: HomeViewModel
  
  func makeUIViewController(context: Context) -> UIViewController {
    return HomeViewController(viewModel: viewModel)
  }
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    
  }
}
