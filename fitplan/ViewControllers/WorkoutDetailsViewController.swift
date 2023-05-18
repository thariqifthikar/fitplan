//
//  UserDetailsViewController.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit
import YouTubeiOSPlayerHelper

class WorkoutDetailsViewController: UIViewController, YTPlayerViewDelegate {
    
    private let workoutView = WorkoutDetailsView();
    var workouttitle: String?
    
    var workoutDetails: WorkoutDetailModel
    
    
    init(item: WorkoutDetailModel) {
        self.workoutDetails = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(workoutDetails.goal) \u{2022} \(workoutDetails.level)"
        
        view.backgroundColor = .systemBackground
        view.addSubview(workoutView)
        
        workoutView.title.text = workoutDetails.title
        workoutView.subtitle.text = workoutDetails.description
        workoutView.video.delegate = self
        workoutView.video.load(withVideoId: workoutDetails.videoURL)
        workoutView.reps.text = String(workoutDetails.repCount)
        workoutView.sets.text = String(workoutDetails.setCount)
        workoutView.bodypart.text = workoutDetails.bodyPart
        workoutView.bodypartimg.kf.setImage(with: workoutDetails.bodyPartURL)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //        loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        workoutView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
}
