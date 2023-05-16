//
//  RegisterViewController.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit

class RegisterViewController: UIViewController{
    private let regView = RegisterView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Welcome onboard!"
        
        view.backgroundColor = .systemBackground
        view.addSubview(regView)
        
        regView.register.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
               
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        regView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
    @objc private func registerAction(){
        let viewcontroller = DetailsViewController()
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
