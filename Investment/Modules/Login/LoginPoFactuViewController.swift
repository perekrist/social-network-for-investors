//
//  LoginCreateViewController.swift
//  Investment
//

import UIKit

class LoginPoFactuViewController: UIViewController {
  private let networkService = NetworkService()
  
  @IBOutlet weak var emailField: UITextField!
  
  @IBOutlet weak var passwordField: UITextField!
  
  @IBAction func noAccountButtonPressed() {
    navigationController?.popViewController(animated: true)
  }
  @IBAction func loginButtonPressed() {
    networkService.login(email: emailField.text ?? "", password: passwordField.text ?? "") { loginResult in
      if loginResult.status != true {
        BannerShowing.shared.showErrorBanner(loginResult.message ?? "Unexpected Error")
        return
      }
      
      guard let token = loginResult.token else {
        BannerShowing.shared.showErrorBanner(loginResult.message ?? "Unexpected Error")
        return
      }
      print(loginResult)
      UserDefaultsService().setUserToken(token)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
