//
//  LoginCreateViewController.swift
//  Investment
//
//  Created by Daniil on 27.11.2021.
//

import UIKit

class LoginPoFactuViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func noAccountButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func loginButtonPressed() {
      NetworkService().loginRequest(email: emailField.text ?? "", password: passwordField.text ?? "") { loginResult in
        if loginResult.status != true {
          BannerShowing.shared.showErrorBanner(loginResult.message ?? "Unexpected Error")
          return
        }
        
        guard let token = loginResult.token else {
          BannerShowing.shared.showErrorBanner(loginResult.message ?? "Unexpected Error")
          return

        }
        print(loginResult)
        CustomUserDefaults().setUserToken(token)
        
        
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
