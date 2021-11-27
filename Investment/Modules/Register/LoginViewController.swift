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
        print("hakina")
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
