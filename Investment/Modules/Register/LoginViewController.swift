//
//  LoginViewControllerXIB.swift
//  Investment
//
//  Created by Daniil on 27.11.2021.
//

import UIKit

class LoginViewController: UIViewController {
  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var surnameField: UITextField!
  @IBOutlet weak var repeatPasswordField: UITextField!
  @IBOutlet weak var emailField: UITextField!
  
  @IBOutlet weak var nicknameField: UITextField!
  @IBOutlet weak var registerButton: UIButton!
  
  @IBOutlet weak var loginButton: UIButton!
  
  @IBAction func registerPressed() {
    NetworkService().registerRequest(email: emailField.text ?? "", password: repeatPasswordField.text ?? "", name: nameField.text ?? "", surname: surnameField.text ?? "", nickname: nicknameField.text ?? "") { loginResult in
      if loginResult.status != true {
        BannerShowing.shared.showErrorBanner(loginResult.message ?? "Unexpected Error")
        return
      }
      
      guard let token = loginResult.token else {
        BannerShowing.shared.showErrorBanner(loginResult.message ?? "Unexpected Error")
        return
        
      }
      CustomUserDefaults().setUserToken(token)
      
      print(loginResult)
    }
  }
  @IBAction func loginPressed() {
    navigationController?.pushViewController(LoginPoFactuViewController(nibName: "LoginPoFactuViewController", bundle: nil), animated: true)
  }
  
  private let viewModel: LoginViewModel = LoginViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor(named: "StartScreenBackground")
    navigationController?.navigationBar.standardAppearance = appearance
    navigationController?.navigationBar.scrollEdgeAppearance = appearance
    navigationController?.navigationBar.backgroundColor = UIColor(named: "StartScreenBackground")
  }
  
  
  
}