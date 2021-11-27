//
//  LoginViewControllerXIB.swift
//  Investment
//
//  Created by Daniil on 27.11.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
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
