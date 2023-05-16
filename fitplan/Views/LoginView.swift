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
        header.translatesAutoresizingMaskIntoConstraints=false
        return header
    }()
    
    private let subheader: UILabel = {
        let subheader = UILabel()
        subheader.textAlignment = .center
        subheader.font = .systemFont(ofSize: 20, weight: .medium)
        subheader.text = "Login or Register to continue..."
        subheader.translatesAutoresizingMaskIntoConstraints=false
        subheader.textColor = .white
        return subheader
    }()
    
    private let banner: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "wallpaper_1"))
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemPink
        imageView.translatesAutoresizingMaskIntoConstraints=false
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
        emailField.translatesAutoresizingMaskIntoConstraints=false
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
        passField.translatesAutoresizingMaskIntoConstraints=false
        return passField
    }()
    
    public let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.backgroundColor = .systemOrange
        loginButton.translatesAutoresizingMaskIntoConstraints=false
        return loginButton
    }()
    
    public let register: UIButton = {
        let regButton = UIButton()
        regButton.setTitle("No account? Register Here!", for: .normal)
        regButton.setTitleColor(.systemOrange, for: .normal)
        regButton.layer.cornerRadius = 10
        regButton.translatesAutoresizingMaskIntoConstraints=false
        return regButton
    }()
    
    private let cardMain: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds=true
        
        cardMain.insertArrangedSubview(email, at: 0)
        cardMain.insertArrangedSubview(password, at: 1)
        cardMain.insertArrangedSubview(loginButton, at: 2)
        
        addSubview(banner)
        addSubview(header)
        addSubview(subheader)
        addSubview(cardMain)
        addSubview(register)
        
        banner.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        banner.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        banner.topAnchor.constraint(equalTo: topAnchor).isActive = true
        banner.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        header.heightAnchor.constraint(equalToConstant: 25).isActive = true
        header.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        header.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        header.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        subheader.heightAnchor.constraint(equalToConstant: 25).isActive = true
        subheader.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        subheader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        subheader.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10).isActive = true
        
        email.heightAnchor.constraint(equalToConstant: 50).isActive = true
        email.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        
        password.heightAnchor.constraint(equalToConstant: 50).isActive = true
        password.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        
        cardMain.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        cardMain.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        register.heightAnchor.constraint(equalToConstant: 50).isActive = true
        register.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        register.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        register.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let fieldHeight: CGFloat = 50
        let fieldStartY: CGFloat = (frame.height/2) - (170/2)
        
    }
}
