//
//  UserDetailsViewController.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit

class WorkoutDetailsViewController: UIViewController {
    
    private let workoutView = WorkoutDetailsView();
    var workouttitle: String?
    var workoutDetails: [WorkoutDetailModel] = [
        WorkoutDetailModel(id: "1", title: "Barbell Bench Press (Incline or Decline)",
                           videoURL: URL(string: "https://www.youtube.com/watch?v=LfyQBUKR8SE"), thumbURL: URL(string: "https://qph.cf2.quoracdn.net/main-qimg-d80b078f955fa2e107023ad547b57e7e-lq"), description: "Lie on an incline or decline bench with a barbell held at shoulder level. Lower the barbell to your chest, then press it back up to the starting position.", setCount: 15, repCount: 20, time: 3, bodyPart: "Torso", bodyPartURL: URL(string: "https://fitnessvolt.com/wp-content/uploads/2020/01/decline-barbell-bench-pres.jpg"), weights: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = workouttitle
        
        view.backgroundColor = .systemBackground
        view.addSubview(workoutView)
        
        workoutView.title.text = workouttitle
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //        loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        workoutView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
}
