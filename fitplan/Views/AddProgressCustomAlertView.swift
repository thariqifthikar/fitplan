//
//  AddProgressCustomAlertView.swift
//  fitplan
//
//  Created by user230748 on 5/21/23.
//

import UIKit

class AddProgressCustomAlertView: UIView {
    
    public let header: UILabel = {
        let header = UILabel()
        header.font = .systemFont(ofSize: 16, weight: .semibold)
        header.text = "Put in Your Reps and Sets for"
        header.translatesAutoresizingMaskIntoConstraints=false
        return header
    }()
    
    public let workoutTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textColor = .systemOrange
        return label
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds=true
        
        addSubview(header)
        addSubview(workoutTitle)
        addSubview(reps)
        addSubview(sets)
        
        header.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        header.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        header.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        workoutTitle.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        workoutTitle.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        workoutTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        reps.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -20).isActive = true
        reps.heightAnchor.constraint(equalToConstant: 50).isActive = true
        reps.topAnchor.constraint(equalTo: workoutTitle.topAnchor, constant: 20).isActive = true
        reps.leadingAnchor.constraint(equalTo: sets.trailingAnchor, constant: 15).isActive = true
        
        sets.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -20).isActive = true
        sets.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sets.topAnchor.constraint(equalTo: workoutTitle.topAnchor, constant: 20).isActive = true
        sets.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
