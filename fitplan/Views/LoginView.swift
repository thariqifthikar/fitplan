//
//  LoginView.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit

class LoginView: UIView {
    
    private let email: UITextField = {
        let emailField = UITextField()
        emailField.keyboardType = .emailAddress
        emailField.placeholder = "Email Address"
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        emailField.leftViewMode = .always
        emailField.layer.cornerRadius = 5
        emailField.backgroundColor = .secondarySystemBackground
        return emailField
    }()
    
    private let password: UITextField = {
        let passField = UITextField()
        passField.isSecureTextEntry = true
        passField.placeholder = "Password"
        passField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        passField.leftViewMode = .always
        passField.layer.cornerRadius = 5
        passField.backgroundColor = .secondarySystemBackground
        return passField
    }()
    
    private let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 5
        loginButton.backgroundColor = .systemOrange
        return loginButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds=true
        
        addSubview(email)
        addSubview(password)
        addSubview(loginButton)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
        email.frame = CGRect(x: 20, y: safeAreaInsets.top, width: frame.width-40, height: 50)
        password.frame = CGRect(x: 20, y: safeAreaInsets.top+60, width: frame.width-40, height: 50)
        loginButton.frame = CGRect(x: 20, y: safeAreaInsets.top+120, width: frame.width-40, height: 50)
    }
}
