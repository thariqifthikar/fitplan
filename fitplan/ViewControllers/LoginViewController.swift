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
        
        func displayAlert(message: String) {
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        
        AuthHandler.shared.loginFunc(email: email, password: password){ [weak self] success in
            guard success else {
                print("login error")
                return
            }
            
            DispatchQueue.main.async {
                let userid = UserDefaults.standard.value(forKey: "userid") as! String
                
                FirebaseDBHandler.shared.getUserDetails(userid: userid){ success, goal, level, equipment in
                    guard success, !goal.isEmpty, !level.isEmpty else {
                        print("failed to fetch user data")
                        displayAlert(message: "An error occurred")
                        AuthHandler.shared.logoutFunc(){ success in
                            guard success else {
                                print("error logging out")
                                return
                            }
                            
                            print("user logged out")
                        }
                        return
                    }
                    
                    UserDefaults.standard.set(goal, forKey: "goal")
                    UserDefaults.standard.set(level, forKey: "level")
                    UserDefaults.standard.set(equipment, forKey: "equipment")
                    
                    let vc: UIViewController
                    vc = TabBarViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true)
                }
                
            }
        }
    }
    
    @objc private func registerAction(){
        let viewcontroller = RegisterViewController()
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
