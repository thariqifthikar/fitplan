//
//  AddProgressView.swift
//  fitplan
//
//  Created by user230748 on 5/20/23.
//

import UIKit

class AddProgressView: UIView {
    
    private let header: UILabel = {
        let header = UILabel()
        header.font = .systemFont(ofSize: 16, weight: .semibold)
        header.text = "Put in Your Reps and Sets for"
        header.translatesAutoresizingMaskIntoConstraints=false
        return header
    }()
    
    private let workoutTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textColor = .systemOrange
        return label
    }()
    
    public let toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = false
        toolbar.backgroundColor = .none
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()
    
    public let reps: UITextField = {
        let textfield = UITextField()
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.keyboardType = .numberPad
        textfield.placeholder = "Sets"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints=false
        textfield.layer.cornerRadius = 10
        textfield.backgroundColor = .secondarySystemBackground
        return textfield
    }()
    
    public let sets: UITextField = {
        let textfield = UITextField()
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.keyboardType = .numberPad
        textfield.placeholder = "Reps"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        textfield.leftViewMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints=false
        textfield.layer.cornerRadius = 10
        textfield.backgroundColor = .secondarySystemBackground
        return textfield
    }()
    
    private let repsSetsHolder: UIStackView = {
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
        button.setTitle("Add Progress", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints=false
        button.backgroundColor = .systemOrange
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds=true
        
        repsSetsHolder.insertArrangedSubview(reps, at: 0)
        repsSetsHolder.insertArrangedSubview(sets, at: 1)
        
        addSubview(header)
        addSubview(workoutTitle)
        addSubview(repsSetsHolder)
        addSubview(continueButton)
        
        header.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        header.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        header.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        workoutTitle.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        workoutTitle.topAnchor.constraint(equalTo: header.topAnchor).isActive = true
        workoutTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        repsSetsHolder.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        repsSetsHolder.heightAnchor.constraint(equalToConstant: 50).isActive = true
        repsSetsHolder.topAnchor.constraint(equalTo: workoutTitle.topAnchor, constant: 20)
        repsSetsHolder.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        continueButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        continueButton.topAnchor.constraint(equalTo: repsSetsHolder.bottomAnchor, constant: 10).isActive = true
        continueButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}


