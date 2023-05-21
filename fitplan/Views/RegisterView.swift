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
    
    public let toolbar: UIToolbar = {
            let toolbar = UIToolbar()
            toolbar.barStyle = .default
            toolbar.isTranslucent = false
        toolbar.backgroundColor = .none
            toolbar.translatesAutoresizingMaskIntoConstraints = false
            return toolbar
        }()
    
    private let cmLabel: UILabel = {
        let label = UILabel()
        label.text = "(Centimeters)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .init(red: 0.34, green: 0.34, blue: 0.34, alpha: 1)
        return label
    }()
    
    public let heightPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    public let heightField: UITextField = {
        let textfield = UITextField()
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Height"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints=false
        textfield.layer.cornerRadius = 10
        textfield.backgroundColor = .secondarySystemBackground
        return textfield
    }()
    
    private let heightHolder: UIStackView = {
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
    
    private let kgLabel: UILabel = {
        let label = UILabel()
        label.text = "(Kilograms)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .init(red: 0.34, green: 0.34, blue: 0.34, alpha: 1)
        return label
    }()
    
    public let weightPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    public let weightField: UITextField = {
        let textfield = UITextField()
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Weight"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints=false
        textfield.layer.cornerRadius = 10
        textfield.backgroundColor = .secondarySystemBackground
        return textfield
    }()
    
    private let weightHolder: UIStackView = {
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
    
    public let goalPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    public let goalField: UITextField = {
        let textfield = UITextField()
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Fitness Goal"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints=false
        textfield.layer.cornerRadius = 10
        textfield.backgroundColor = .secondarySystemBackground
        return textfield
    }()
    
    public let levelPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    public let levelField: UITextField = {
        let textfield = UITextField()
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.keyboardType = .emailAddress
        textfield.placeholder = "Activity Level"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints=false
        textfield.layer.cornerRadius = 10
        textfield.backgroundColor = .secondarySystemBackground
        return textfield
    }()
    
    private let equipLabel: UILabel = {
        let label = UILabel()
        label.text = "Exercise Equipment"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let equipPicker: UISegmentedControl = {
        let selector = UISegmentedControl(items: ["Yes", "No"])
        selector.translatesAutoresizingMaskIntoConstraints = false
        selector.layer.cornerRadius = 10
        selector.tintColor = .secondarySystemBackground
        selector.backgroundColor = .secondarySystemBackground
        return selector
    }()
    
    private let equipHolder: UIStackView = {
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
    
    public let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save and Continue", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints=false
        button.backgroundColor = .systemOrange
        return button
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds=true
        heightHolder.insertArrangedSubview(heightField, at: 0)
        heightHolder.insertArrangedSubview(cmLabel, at: 1)
        
        weightHolder.insertArrangedSubview(weightField, at: 0)
        weightHolder.insertArrangedSubview(kgLabel, at: 1)
        
        equipHolder.insertArrangedSubview(equipLabel, at: 0)
        equipHolder.insertArrangedSubview(equipPicker, at: 1)
        
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
        
        cardMain.insertArrangedSubview(heightHolder, at: 8)
        cardMain.insertArrangedSubview(weightHolder, at: 9)
        cardMain.insertArrangedSubview(goalField, at: 10)
        cardMain.insertArrangedSubview(levelField, at: 11)
        cardMain.insertArrangedSubview(equipHolder, at: 12)
        
        scroll.addSubview(cardMain)
        
        addSubview(banner)
        addSubview(scroll)
        addSubview(register)
//        addSubview(register)
        
        banner.clipsToBounds = true
        
        banner.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        banner.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        banner.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        banner.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        header.heightAnchor.constraint(equalToConstant: 25).isActive = true
        header.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        header.topAnchor.constraint(equalTo: cardMain.topAnchor, constant: 10).isActive = true
        
        firstName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstName.widthAnchor.constraint(equalTo: cardMain.widthAnchor).isActive = true
        
        lastName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        lastName.widthAnchor.constraint(equalTo: cardMain.widthAnchor).isActive = true
        
        email.heightAnchor.constraint(equalToConstant: 50).isActive = true
        email.widthAnchor.constraint(equalTo: cardMain.widthAnchor).isActive = true
        
        dobHolder.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dobHolder.widthAnchor.constraint(equalTo: cardMain.widthAnchor).isActive = true
        
        dob.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dob.widthAnchor.constraint(equalTo: cardMain.widthAnchor, multiplier: 0.5).isActive = true
        dob.trailingAnchor.constraint(equalTo: cardMain.trailingAnchor, constant: -8).isActive = true
        
        dobLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        dobLabel.widthAnchor.constraint(equalTo: cardMain.widthAnchor, multiplier: 0.5).isActive = true
        dobLabel.leadingAnchor.constraint(equalTo: cardMain.leadingAnchor, constant: 10).isActive = true
        
        gender.heightAnchor.constraint(equalToConstant: 50).isActive = true
        gender.widthAnchor.constraint(equalTo: cardMain.widthAnchor).isActive = true
        
        password.heightAnchor.constraint(equalToConstant: 50).isActive = true
        password.widthAnchor.constraint(equalTo: cardMain.widthAnchor).isActive = true
        
        confpassword.heightAnchor.constraint(equalToConstant: 50).isActive = true
        confpassword.widthAnchor.constraint(equalTo: cardMain.widthAnchor).isActive = true
        
        heightField.widthAnchor.constraint(equalTo: cardMain.widthAnchor, multiplier: 0.5).isActive = true
        heightField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cmLabel.widthAnchor.constraint(equalTo: cardMain.widthAnchor, multiplier: 0.5).isActive = true
        cmLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        heightHolder.widthAnchor.constraint(equalTo: cardMain.widthAnchor).isActive = true
        heightHolder.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        weightField.widthAnchor.constraint(equalTo: cardMain.widthAnchor, multiplier: 0.5).isActive = true
        weightField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        kgLabel.widthAnchor.constraint(equalTo: cardMain.widthAnchor, multiplier: 0.5).isActive = true
        kgLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        weightHolder.widthAnchor.constraint(equalTo: cardMain.widthAnchor).isActive = true
        weightHolder.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        goalField.widthAnchor.constraint(equalTo: cardMain.widthAnchor).isActive = true
        goalField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        levelField.widthAnchor.constraint(equalTo: cardMain.widthAnchor).isActive = true
        levelField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        equipPicker.widthAnchor.constraint(equalTo: cardMain.widthAnchor, multiplier: 0.4).isActive = true
        equipPicker.heightAnchor.constraint(equalToConstant: 50).isActive = true
        equipPicker.centerYAnchor.constraint(equalTo: equipHolder.centerYAnchor).isActive = true
        
        equipLabel.widthAnchor.constraint(equalTo: cardMain.widthAnchor, multiplier: 0.5).isActive = true
        equipLabel.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20).isActive = true
        equipLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        equipHolder.widthAnchor.constraint(equalTo: cardMain.widthAnchor).isActive = true
        equipHolder.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        register.heightAnchor.constraint(equalToConstant: 50).isActive = true
        register.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        register.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        register.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        scroll.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        scroll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scroll.bottomAnchor.constraint(equalTo: register.topAnchor, constant: -10).isActive = true
        scroll.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        cardMain.widthAnchor.constraint(equalTo: scroll.widthAnchor, constant: -30).isActive = true
        cardMain.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        cardMain.bottomAnchor.constraint(equalTo: scroll.bottomAnchor).isActive = true
        cardMain.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 15).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
}
