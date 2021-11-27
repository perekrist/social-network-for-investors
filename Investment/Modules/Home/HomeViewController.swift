//
//  HomeViewController.swift
//  Investment
//

import UIKit

class HomeViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .orange
  }
  
  init(viewModel: HomeViewModel) {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
