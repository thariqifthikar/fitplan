//
//  LoginView.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit

class LoginView: UIView {
    
    private let header: UILabel = {
        let header = UILabel()
        header.textAlignment = .center
        header.font = .systemFont(ofSize: 30, weight: .bold)
        header.text = "Welcome to FitPlan!"
        header.textColor = .white
        return header
    }()
    
    private let subheader: UILabel = {
        let subheader = UILabel()
        subheader.textAlignment = .center
        subheader.font = .systemFont(ofSize: 20, weight: .medium)
        subheader.text = "Login or Register to continue..."
        subheader.textColor = .white
        return subheader
    }()
    
    private let banner: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "wallpaper_1"))
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemPink
        return imageView
    }()
    
    public let email: UITextField = {
        let emailField = UITextField()
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        emailField.keyboardType = .emailAddress
        emailField.placeholder = "Email Address"
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        emailField.leftViewMode = .always
        emailField.layer.cornerRadius = 10
        emailField.backgroundColor = .secondarySystemBackground
        return emailField
    }()
    
    public let password: UITextField = {
        let passField = UITextField()
        passField.isSecureTextEntry = true
        passField.autocapitalizationType = .none
        passField.autocorrectionType = .no
        passField.placeholder = "Password"
        passField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        passField.leftViewMode = .always
        passField.layer.cornerRadius = 10
        passField.backgroundColor = .secondarySystemBackground
        return passField
    }()
    
    public let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.backgroundColor = .systemOrange
        return loginButton
    }()
    
    public let register: UIButton = {
        let regButton = UIButton()
        regButton.setTitle("No account? Register Here!", for: .normal)
        regButton.setTitleColor(.systemOrange, for: .normal)
        regButton.layer.cornerRadius = 10
        return regButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds=true
        
        addSubview(banner)
        addSubview(header)
        addSubview(subheader)
        addSubview(email)
        addSubview(password)
        addSubview(loginButton)
        addSubview(register)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let fieldHeight: CGFloat = 50
        let fieldStartY: CGFloat = (frame.height/2) - (170/2)
        
        header.frame = CGRect(x: 0, y: safeAreaInsets.top, width: frame.width, height: 20)
        subheader.frame = CGRect(x: 0, y: safeAreaInsets.top + 40, width: frame.width, height: 20)
        
        banner.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        email.frame = CGRect(x: 20, y: fieldStartY, width: frame.width-40, height: fieldHeight)
        password.frame = CGRect(x: 20, y: fieldStartY + 60, width: frame.width-40, height: fieldHeight)
        loginButton.frame = CGRect(x: 20, y: fieldStartY + 120, width: frame.width-40, height: fieldHeight)
        register.frame = CGRect(x: 20, y: frame.height - 70, width: frame.width-40, height: fieldHeight)
    }
}
