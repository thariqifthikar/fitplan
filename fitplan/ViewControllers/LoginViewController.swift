//
//  LoginViewController.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit

class LoginViewController: UIViewController{
    private let loginView = LoginView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(loginView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        loginView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
}
