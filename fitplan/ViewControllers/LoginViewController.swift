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
        
        loginView.loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        loginView.register.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //        loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
    @objc private func loginAction(){
        
        guard
            let email = loginView.email.text, !email.isEmpty,
            let password = loginView.password.text, !password.isEmpty
        else {
            return
        }
        
        AuthHandler.shared.loginFunc(email: email, password: password){ [weak self] success in
            guard success else {
                print("login error")
                return
            }
            
            DispatchQueue.main.async {
                let userid = UserDefaults.standard.value(forKey: "userid") as! String
                
                FirebaseDBHandler.shared.userHasDetails(userid: userid){ hasDetails in
                    let vc: UIViewController
                    if hasDetails {
                        
                        FirebaseDBHandler.shared.setUserDetails(userid: userid){ success in
                            let vc: UIViewController
                            guard success else {
                                print("error setting defaults")
                                return
                            }
                            
                            vc = TabBarViewController()
                            vc.modalPresentationStyle = .fullScreen
                            self?.present(vc, animated: true)
                        }
                    } else {
                        vc = DetailsViewController()
                        vc.modalPresentationStyle = .fullScreen
                        self?.present(vc, animated: true)
                    }
                }
                
            }
        }
    }
    
    @objc private func registerAction(){
        let viewcontroller = RegisterViewController()
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
