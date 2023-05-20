//
//  ProgressDetailViewController.swift
//  fitplan
//
//  Created by user230748 on 5/20/23.
//

import UIKit
import YouTubeiOSPlayerHelper

class ProgressDetailViewController: UIViewController {
    
    private let progressDetailView = ProgressDetailsView();
    var workouttitle: String?
    
    var progressDetails: ProgressModel
    
    
    init(item: ProgressModel) {
        self.progressDetails = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(progressDetails.workoutTitle)"
        
        view.backgroundColor = .systemBackground
        view.addSubview(progressDetailView)
        
        progressDetailView.title.text = workoutDetails.title
        progressDetailView.subtitle.text = workoutDetails.description
        progressDetailView.reps.text = String(workoutDetails.repCount)
        progressDetailView.sets.text = String(workoutDetails.setCount)
        progressDetailView.bodypart.text = workoutDetails.bodyPart
        progressDetailView.bodypartimg.kf.setImage(with: workoutDetails.bodyPartURL)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //        loginView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        workoutView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
}
