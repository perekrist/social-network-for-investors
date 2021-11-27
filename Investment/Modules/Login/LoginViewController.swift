//
//  LoginCreateViewController.swift
//  Investment
//

import UIKit

class LoginViewController: UIViewController {
  private let networkService = NetworkService()
  
  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  
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
      
      guard let token = loginResult.token else {
        BannerShowing.shared.showErrorBanner(loginResult.message ?? "Unexpected Error")
        return
      }
      print(loginResult)
      UserDefaultsService().setUserToken(token)
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    textFields = [emailField,
                  passwordField]
    
    for field in textFields {
      field.delegate = self
      field.returnKeyType = .next
    }
    
    passwordField.returnKeyType = .done
    
    
    // delete
    let view = ProfileDetailsView()
    self.view.addSubview(view)
    view.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(20)
      make.centerY.equalToSuperview()
    }
    view.setup(name: "Daniel", surname: "Krivelev", isOnline: false, followers: 190, following: 202, likes: 158, isEditable: false)
    
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
