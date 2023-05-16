//
//  DetailsViewController.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//
import UIKit

class DetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    private let detView = DetailsView();
    private var heightData: [Int] = Array(1...300)
    private var weightData: [Int] = Array(1...300)
    private var goalData = ["Weight Loss", "Muscle Building", "Strength Training"]
    private var levelData = ["Beginner", "Intermediate", "Advanced"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Enter your Details..."
        
        view.backgroundColor = .systemBackground
        view.addSubview(detView)
        
        detView.heightPicker.delegate = self
        detView.weightPicker.delegate = self
        detView.goalPicker.delegate = self
        detView.levelPicker.delegate = self
        
        detView.heightField.inputView = detView.heightPicker
        detView.weightField.inputView = detView.weightPicker
        detView.goalField.inputView = detView.goalPicker
        detView.levelField.inputView = detView.levelPicker
        
        detView.heightField.inputAccessoryView = detView.toolbar
        detView.weightField.inputAccessoryView = detView.toolbar
        detView.goalField.inputAccessoryView = detView.toolbar
        detView.levelField.inputAccessoryView = detView.toolbar
        
        detView.continueButton.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(cancelButtonAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        detView.toolbar.setItems([flexSpace, doneButton], animated: false)
        detView.toolbar.sizeToFit()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        detView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
    @objc private func continueAction(){
        
    }
    
    @objc private func cancelButtonAction(){
        detView.heightField.resignFirstResponder()
        detView.weightField.resignFirstResponder()
        detView.goalField.resignFirstResponder()
        detView.levelField.resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == detView.heightPicker {
            return heightData.count
        } else if pickerView == detView.weightPicker {
            return weightData.count
        } else if pickerView == detView.goalPicker {
            return goalData.count
        } else if pickerView == detView.levelPicker {
            return levelData.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == detView.heightPicker {
            return "\(heightData[row])"
        } else if pickerView == detView.weightPicker {
            return "\(weightData[row])"
        } else if pickerView == detView.goalPicker {
            return "\(goalData[row])"
        } else if pickerView == detView.levelPicker {
            return "\(levelData[row])"
        } else {
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == detView.heightPicker {
            let selectedHeight = heightData[row]
            detView.heightField.text = "\(selectedHeight)"
        } else if pickerView == detView.weightPicker {
            let selectedWeight = weightData[row]
            detView.weightField.text = "\(selectedWeight)"
        } else if pickerView == detView.goalPicker {
            let selectedGoal = goalData[row]
            detView.goalField.text = selectedGoal
        } else if pickerView == detView.levelPicker {
            let selectedLevel = levelData[row]
            detView.levelField.text = selectedLevel
        } else {
            
        }
    }
}
