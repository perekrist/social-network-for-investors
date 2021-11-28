//
//  LoginViewControllerXIB.swift
//  Investment
//

import UIKit

class RegisterViewController: UIViewController {
  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var surnameField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var nicknameField: UITextField!
  
  var onDidAuthorize: (() -> ())?
  
  private var textFields: [UITextField] = []
  private let networkService = NetworkService()
  
  @IBAction func registerPressed() {
    networkService.register(email: emailField.text ?? "",
                            password: passwordField.text ?? "",
                            name: nameField.text ?? "",
                            surname: surnameField.text ?? "",
                            nickname: nicknameField.text ?? "") { loginResult in
      if loginResult.status != true {
        BannerShowing.shared.showErrorBanner(loginResult.message ?? "Unexpected Error")
        return
      }
      
      guard let token = loginResult.token else {
        BannerShowing.shared.showErrorBanner(loginResult.message ?? "Unexpected Error")
        return
      }
      UserDefaultsService().setUserToken(token)
      self.onDidAuthorize?()
      self.navigationController?.popViewController(animated: true)
      self.dismiss(animated: true, completion: nil)
    }
  }
  @IBAction func loginPressed() {
    let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
    loginViewController.onDidAuthorize = { [weak self] in
      self?.onDidAuthorize?()
      self?.navigationController?.popViewController(animated: true)
    }
    navigationController?.pushViewController(loginViewController, animated: true)
    dismiss(animated: true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor(named: "StartScreenBackground")
    navigationController?.navigationBar.standardAppearance = appearance
    navigationController?.navigationBar.scrollEdgeAppearance = appearance
    navigationController?.navigationBar.backgroundColor = UIColor(named: "StartScreenBackground")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    textFields = [nameField,
                  surnameField,
                  emailField,
                  nicknameField,
                  passwordField]
    
    for field in textFields {
      field.delegate = self
      field.returnKeyType = .next
    }
    
    passwordField.returnKeyType = .done
    
  }
}

// MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
  
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
