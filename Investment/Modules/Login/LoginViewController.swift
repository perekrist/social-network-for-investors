//
//  LoginViewController.swift
//  Investment
//

import UIKit

class LoginViewController: UIViewController {
  private let viewModel: LoginViewModel = LoginViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .blue
  }
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
