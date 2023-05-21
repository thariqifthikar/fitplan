//
//  RegisterViewController.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    private let regView = RegisterView();
    private var heightData: [Int] = Array(1...300)
    private var weightData: [Int] = Array(1...300)
    private var goalData = ["Weight Loss", "Muscle Building", "Strength Training"]
    private var levelData = ["Beginner", "Intermediate", "Advanced"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Welcome onboard!"
        
        view.backgroundColor = .systemBackground
        view.addSubview(regView)
        
        regView.register.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        
        regView.heightPicker.delegate = self
        regView.weightPicker.delegate = self
        regView.goalPicker.delegate = self
        regView.levelPicker.delegate = self
        
        regView.heightField.inputView = regView.heightPicker
        regView.weightField.inputView = regView.weightPicker
        regView.goalField.inputView = regView.goalPicker
        regView.levelField.inputView = regView.levelPicker
        
        regView.heightField.inputAccessoryView = regView.toolbar
        regView.weightField.inputAccessoryView = regView.toolbar
        regView.goalField.inputAccessoryView = regView.toolbar
        regView.levelField.inputAccessoryView = regView.toolbar
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(cancelButtonAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        regView.toolbar.setItems([flexSpace, doneButton], animated: false)
        regView.toolbar.sizeToFit()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        regView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
    @objc private func registerAction(){
        
        
        let dob = regView.dob.date.timeIntervalSince1970
        
        guard let firstName = regView.firstName.text, !firstName.isEmpty else {
            displayAlert(message: "Please enter your first name")
            return
        }
        
        guard let lastName = regView.lastName.text, !lastName.isEmpty else {
            displayAlert(message: "Please enter your last name")
            return
        }
        
        guard let email = regView.email.text, !email.isEmpty else {
            displayAlert(message: "Please enter your email")
            return
        }
        
        let gender: String
        switch regView.gender.selectedSegmentIndex {
        case 0:
            gender = "Male"
        case 1:
            gender = "Female"
        default:
            displayAlert(message: "Please select your gender")
            return
        }
        
        guard let password = regView.password.text, !password.isEmpty else {
            displayAlert(message: "Please enter a password")
            return
        }
        
        guard let confirmPassword = regView.confpassword.text, !confirmPassword.isEmpty else {
            displayAlert(message: "Please confirm your password")
            return
        }
        
        guard password.count > 6 else {
            displayAlert(message: "Password must have more than 6 characters")
            return
        }
        
        guard password == confirmPassword else {
            displayAlert(message: "Passwords do not match")
            return
        }
        
        guard let height = regView.heightField.text, !height.isEmpty else {
            displayAlert(message: "Please select your height")
            return
        }
        
        guard let heightString = regView.heightField.text, !heightString.isEmpty, let height = Double(heightString), height > 0 else {
            displayAlert(message: "Please select a valid height")
            return
        }
        
        guard let weightString = regView.weightField.text, !weightString.isEmpty, let weight = Double(weightString), weight > 0 else {
            displayAlert(message: "Please select a valid weight")
            return
        }
        
        guard let goal = regView.goalField.text, !goal.isEmpty else {
            displayAlert(message: "Please select your goal")
            return
        }
        
        guard let level = regView.levelField.text, !level.isEmpty else {
            displayAlert(message: "Please select your level")
            return
        }
        
        let hasEquipment: Bool
        switch regView.equipPicker.selectedSegmentIndex {
        case 0:
            hasEquipment = true
        case 1:
            hasEquipment = false
        default:
            displayAlert(message: "Please select your equipment")
            return
        }
        
        func displayAlert(message: String) {
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        
        let user = UserModel(
            id: "",
            firstName: firstName,
            lastName: lastName,
            dob: dob,
            gender: gender,
            height: Float(height),
            weight: Float(weight),
            equipment: hasEquipment,
            goal: goal,
            level: level
        )
        
        AuthHandler.shared.registerFunc(email: email, password: password, user: user){ success in
            guard success else {
                print("error registering")
                return
            }
            
            UserDefaults.standard.set(level, forKey: "level")
            UserDefaults.standard.set(goal, forKey: "goal")
            UserDefaults.standard.set(hasEquipment, forKey: "equpment")
            
            DispatchQueue.main.async {
                let vc = TabBarViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
                self.present(vc, animated: true)
            }
        }
        
    }
    
    @objc private func cancelButtonAction(){
        regView.heightField.resignFirstResponder()
        regView.weightField.resignFirstResponder()
        regView.goalField.resignFirstResponder()
        regView.levelField.resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == regView.heightPicker {
            return heightData.count
        } else if pickerView == regView.weightPicker {
            return weightData.count
        } else if pickerView == regView.goalPicker {
            return goalData.count
        } else if pickerView == regView.levelPicker {
            return levelData.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == regView.heightPicker {
            return "\(heightData[row])"
        } else if pickerView == regView.weightPicker {
            return "\(weightData[row])"
        } else if pickerView == regView.goalPicker {
            return "\(goalData[row])"
        } else if pickerView == regView.levelPicker {
            return "\(levelData[row])"
        } else {
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == regView.heightPicker {
            let selectedHeight = heightData[row]
            regView.heightField.text = "\(selectedHeight)"
        } else if pickerView == regView.weightPicker {
            let selectedWeight = weightData[row]
            regView.weightField.text = "\(selectedWeight)"
        } else if pickerView == regView.goalPicker {
            let selectedGoal = goalData[row]
            regView.goalField.text = selectedGoal
        } else if pickerView == regView.levelPicker {
            let selectedLevel = levelData[row]
            regView.levelField.text = selectedLevel
        } else {
            
        }
    }
}
