//
//  DetailsView.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit

class DetailsView: UIView {
    
    private let header: UILabel = {
        let header = UILabel()
        header.textAlignment = .center
        header.font = .systemFont(ofSize: 20, weight: .bold)
        header.text = "Enter Your Details"
        header.translatesAutoresizingMaskIntoConstraints=false
        return header
    }()
    
    private let subheader: UILabel = {
        let header = UILabel()
        header.textAlignment = .center
        header.numberOfLines=0
        header.font = .systemFont(ofSize: 14, weight: .medium)
        header.text = "We need a few details to identify your current activity and suggest the most suitable workouts..."
        header.translatesAutoresizingMaskIntoConstraints=false
        return header
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds=true
        
        heightHolder.insertArrangedSubview(heightField, at: 0)
        heightHolder.insertArrangedSubview(cmLabel, at: 1)
        
        weightHolder.insertArrangedSubview(weightField, at: 0)
        weightHolder.insertArrangedSubview(kgLabel, at: 1)
        
        equipHolder.insertArrangedSubview(equipLabel, at: 0)
        equipHolder.insertArrangedSubview(equipPicker, at: 1)
        
        cardMain.insertArrangedSubview(header, at: 0)
        cardMain.insertArrangedSubview(subheader, at: 1)
        cardMain.insertArrangedSubview(heightHolder, at: 2)
        cardMain.insertArrangedSubview(weightHolder, at: 3)
        cardMain.insertArrangedSubview(goalField, at: 4)
        cardMain.insertArrangedSubview(levelField, at: 5)
        cardMain.insertArrangedSubview(equipHolder, at: 6)
        
        
        scroll.addSubview(cardMain)
        
        addSubview(scroll)
        addSubview(continueButton)
        
        header.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        header.topAnchor.constraint(equalTo: cardMain.topAnchor, constant: 30).isActive = true
        
        subheader.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        
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
        equipLabel.leadingAnchor.constraint(equalTo: cardMain.leadingAnchor, constant: 20).isActive = true
        equipLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        equipHolder.widthAnchor.constraint(equalTo: cardMain.widthAnchor).isActive = true
        equipHolder.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        continueButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        continueButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        cardMain.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        cardMain.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
        
        scroll.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        scroll.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scroll.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
        scroll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scroll.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}

