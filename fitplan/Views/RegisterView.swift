//
//  RegisterView.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit

class RegisterView: UIView {
    
    private let header: UILabel = {
        let header = UILabel()
        header.textAlignment = .center
        header.font = .systemFont(ofSize: 20, weight: .medium)
        header.text = "We're happy to have you!"
        header.textColor = .white
        header.translatesAutoresizingMaskIntoConstraints=false
        return header
    }()
    
    private let banner: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "wallpaper_2"))
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemPink
        imageView.translatesAutoresizingMaskIntoConstraints=false
        return imageView
    }()
    
    public let firstName: UITextField = {
        let textfield = UITextField()
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "First Name"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints=false
        textfield.layer.cornerRadius = 10
        textfield.backgroundColor = .secondarySystemBackground
        return textfield
    }()
    
    public let lastName: UITextField = {
        let textfield = UITextField()
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Last Name"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints=false
        textfield.layer.cornerRadius = 10
        textfield.backgroundColor = .secondarySystemBackground
        return textfield
    }()
    
    public let email: UITextField = {
        let emailField = UITextField()
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        emailField.keyboardType = .emailAddress
        emailField.placeholder = "Email Address"
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        emailField.leftViewMode = .always
        emailField.translatesAutoresizingMaskIntoConstraints=false
        emailField.layer.cornerRadius = 10
        emailField.backgroundColor = .secondarySystemBackground
        return emailField
    }()
    
    public let dobLabel: UILabel = {
        let label = UILabel()
        label.text = "Date of Birth"
        return label
    }()
    
    public let dob: UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    public let gender: UISegmentedControl = {
        let selector = UISegmentedControl(items: ["Male", "Female"])
        selector.translatesAutoresizingMaskIntoConstraints = false
        selector.layer.cornerRadius = 10
        selector.tintColor = .secondarySystemBackground
        selector.backgroundColor = .secondarySystemBackground
        return selector
    }()
    
    public let password: UITextField = {
        let passField = UITextField()
        passField.isSecureTextEntry = true
        passField.autocapitalizationType = .none
        passField.autocorrectionType = .no
        passField.placeholder = "Password"
        passField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        passField.leftViewMode = .always
        passField.translatesAutoresizingMaskIntoConstraints=false
        passField.layer.cornerRadius = 10
        passField.backgroundColor = .secondarySystemBackground
        return passField
    }()
    
    public let confpassword: UITextField = {
        let passField = UITextField()
        passField.isSecureTextEntry = true
        passField.autocapitalizationType = .none
        passField.autocorrectionType = .no
        passField.placeholder = "Confirm Password"
        passField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        passField.leftViewMode = .always
        passField.translatesAutoresizingMaskIntoConstraints=false
        passField.layer.cornerRadius = 10
        passField.backgroundColor = .secondarySystemBackground
        return passField
    }()
    
    public let register: UIButton = {
        let register = UIButton()
        register.setTitle("Register", for: .normal)
        register.titleLabel?.font = .boldSystemFont(ofSize: 20)
        register.setTitleColor(.white, for: .normal)
        register.layer.cornerRadius = 10
        register.translatesAutoresizingMaskIntoConstraints=false
        register.backgroundColor = .systemOrange
        return register
    }()
    
    private let dobHolder: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.backgroundColor = .secondarySystemBackground
        stackView.layer.cornerRadius = 10
        stackView.spacing = 10
        return stackView
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
    
    private let scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isScrollEnabled = true
        return scroll
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds=true
        
        dobHolder.insertArrangedSubview(dobLabel, at: 0)
        dobHolder.insertArrangedSubview(dob, at: 1)
        
        cardMain.insertArrangedSubview(header, at: 0)
        cardMain.insertArrangedSubview(firstName, at: 1)
        cardMain.insertArrangedSubview(lastName, at: 2)
        cardMain.insertArrangedSubview(email, at: 3)
        cardMain.insertArrangedSubview(dobHolder, at: 4)
        cardMain.insertArrangedSubview(gender, at: 5)
        cardMain.insertArrangedSubview(password, at: 6)
        cardMain.insertArrangedSubview(confpassword, at: 7)
        cardMain.insertArrangedSubview(register, at: 8)

        
        scroll.addSubview(cardMain)
        
        addSubview(banner)
        addSubview(scroll)
//        addSubview(register)
        
        banner.clipsToBounds = true
        
        banner.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        banner.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        banner.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        banner.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        header.heightAnchor.constraint(equalToConstant: 25).isActive = true
        header.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        header.topAnchor.constraint(equalTo: cardMain.topAnchor, constant: 10).isActive = true
        
        firstName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstName.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        
        lastName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        lastName.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        
        email.heightAnchor.constraint(equalToConstant: 50).isActive = true
        email.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        
        dobHolder.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dobHolder.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        
        dob.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dob.widthAnchor.constraint(equalTo: cardMain.widthAnchor, multiplier: 0.5).isActive = true
        dob.trailingAnchor.constraint(equalTo: cardMain.trailingAnchor, constant: -8).isActive = true
        
        dobLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dobLabel.widthAnchor.constraint(equalTo: cardMain.widthAnchor, multiplier: 0.5).isActive = true
        dobLabel.leadingAnchor.constraint(equalTo: cardMain.leadingAnchor, constant: 10).isActive = true
        
        gender.heightAnchor.constraint(equalToConstant: 50).isActive = true
        gender.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        
        password.heightAnchor.constraint(equalToConstant: 50).isActive = true
        password.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        
        confpassword.heightAnchor.constraint(equalToConstant: 50).isActive = true
        confpassword.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        
        register.heightAnchor.constraint(equalToConstant: 50).isActive = true
        register.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        
        cardMain.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        scroll.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        scroll.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
        scroll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scroll.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let fieldHeight: CGFloat = 50
        let fieldStartY: CGFloat = (frame.height/2) - (170/2)
        
        
        
//        header.frame = CGRect(x: 0, y: 0, width: frame.width, height: 25)
//
//        banner.frame = CGRect(x: 0, y: safeAreaInsets.top, width: frame.width, height: frame.height-safeAreaInsets.top)
//
//        email.frame = CGRect(x: 20, y: fieldStartY+10, width: frame.width-40, height: fieldHeight)
//        password.frame = CGRect(x: 20, y: fieldStartY + 60, width: frame.width-40, height: fieldHeight)
//        register.frame = CGRect(x: 20, y: fieldStartY + 120, width: frame.width-40, height: fieldHeight)
//
//
//        header.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
    }
}
