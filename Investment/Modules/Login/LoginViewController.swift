//
//  LoginCreateViewController.swift
//  Investment
//

import UIKit

class LoginViewController: UIViewController {
  private let networkService = NetworkService()
  
  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  
  var onDidAuthorize: (() -> ())?
  private var textFields: [UITextField] = []
  
  @IBAction func noAccountButtonPressed() {
    navigationController?.popViewController(animated: true)
  }
  @IBAction func loginButtonPressed() {
    networkService.login(email: emailField.text ?? "", password: passwordField.text ?? "") { loginResult in
      if loginResult.status != true {
        BannerShowing.shared.showErrorBanner(loginResult.message ?? "Unexpected Error")
        return
      }
      
      guard let token = loginResult.token, let userID = loginResult.user_id else {
        BannerShowing.shared.showErrorBanner(loginResult.message ?? "Unexpected Error")
        return
      }
      print(loginResult)
      UserDefaultsService().setUserToken(token)
      UserDefaultsService().setUserID(userID)
      self.onDidAuthorize?()
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    emailField.text = "demo@example.ru"
    passwordField.text = "demo"
    
    textFields = [emailField,
                  passwordField]
    
    for field in textFields {
      field.delegate = self
      field.returnKeyType = .next
    }
    
    passwordField.returnKeyType = .done
  }
  
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard let index = textFields.firstIndex(of: textField) else {
      return true
    }
    
    guard index != textFields.count - 1 else {
      textField.resignFirstResponder()
      return true
    }
    
    textFields[index + 1].becomeFirstResponder()
    
   return true
  }
}
