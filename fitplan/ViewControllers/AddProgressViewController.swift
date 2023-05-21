//
//  AddProgressView.swift
//  fitplan
//
//  Created by user230748 on 5/20/23.
//

import UIKit

class AddProgressViewController: UIViewController {
    
    weak var delegate: ProgressViewDelegate?
    
    private let addProgressView = AddProgressView();
    private let workoutTitle: String
    private let workoutId: String
    private let workoutThumbURL: URL?
    
    init(workoutTitle: String, workoutId: String, workoutThumbURL: URL) {
        self.workoutId = workoutId
        self.workoutTitle = workoutTitle
        self.workoutThumbURL = workoutThumbURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = .systemBackground
        view.addSubview(addProgressView)
        
        addProgressView.continueButton.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        addProgressView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
    @objc private func continueAction(){
        
        guard let userid = AuthHandler.shared.auth.currentUser?.uid else {
            print("no user id")
            return
        }
        
        guard let setsString = addProgressView.sets.text, let setsInt = Int(setsString), let repsString = addProgressView.reps.text, let repsInt = Int(repsString) else {
            print("reps and sets not converted to int")
            return
        }
        
        let progress = ProgressModel(
            id: "",
            workoutId: workoutId,
            workoutTitle: workoutTitle,
            workoutThumbURL: workoutThumbURL?.absoluteURL,
            userId: userid,
            sets: setsInt,
            reps: repsInt,
            timestamp: Date().timeIntervalSince1970
        )
        
        FirebaseDBHandler.shared.addProgress(progress: progress) { success in
            guard success else {
                print("Error occured when adding progress")
                return
            }
            
            self.delegate?.didAddProgress()
            self.dismiss(animated: true)
            
        }
    }
}
