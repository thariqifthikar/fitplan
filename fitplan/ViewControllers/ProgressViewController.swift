//
//  ProgressViweController.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit

class ProgressViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let progressView = ProgressView();
    
    var workouts: [WorkoutProgressModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(progressView)
        
        progressView.collection.dataSource = self
        progressView.collection.delegate = self
        
        setupData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        progressView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkoutProgressViewCell.reuseIdentifier, for: indexPath) as! WorkoutProgressViewCell
        cell.configure(with: workouts[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width
        return CGSize(width: itemWidth, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let workoutTitle: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 20, weight: .bold)
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textColor = .systemOrange
            label.numberOfLines = 0
            return label
        }()
        
        let reps: UITextField = {
            let textfield = UITextField()
            textfield.autocapitalizationType = .none
            textfield.autocorrectionType = .no
            textfield.keyboardType = .numberPad
            textfield.textAlignment = .center
            textfield.placeholder = "Reps"
            textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
            textfield.leftViewMode = .always
            textfield.translatesAutoresizingMaskIntoConstraints=false
            textfield.layer.cornerRadius = 10
            textfield.backgroundColor = .secondarySystemBackground
            return textfield
        }()
        
        let sets: UITextField = {
            let textfield = UITextField()
            textfield.autocapitalizationType = .none
            textfield.autocorrectionType = .no
            textfield.keyboardType = .numberPad
            textfield.textAlignment = .center
            textfield.placeholder = "Sets"
            textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
            textfield.leftViewMode = .always
            textfield.translatesAutoresizingMaskIntoConstraints=false
            textfield.layer.cornerRadius = 10
            textfield.backgroundColor = .secondarySystemBackground
            return textfield
        }()
        
        let alertController = UIAlertController(title: "Put in your Reps and Sets for", message: nil, preferredStyle: .alert)
        let alertViewController = UIViewController()
        
        alertViewController.view.addSubview(workoutTitle)
        alertViewController.view.addSubview(sets)
        alertViewController.view.addSubview(reps)
        
        workoutTitle.widthAnchor.constraint(equalTo: alertViewController.view.widthAnchor, constant: -30).isActive = true
        workoutTitle.topAnchor.constraint(equalTo: alertViewController.view.topAnchor).isActive = true
        workoutTitle.leadingAnchor.constraint(equalTo: alertViewController.view.leadingAnchor, constant: 15).isActive = true
        
        reps.widthAnchor.constraint(equalTo: alertViewController.view.widthAnchor, constant: -30).isActive = true
        reps.heightAnchor.constraint(equalToConstant: 50).isActive = true
        reps.topAnchor.constraint(equalTo: sets.bottomAnchor, constant: 10).isActive = true
        reps.bottomAnchor.constraint(equalTo: alertViewController.view.bottomAnchor, constant: -20).isActive = true
        
        sets.widthAnchor.constraint(equalTo: alertViewController.view.widthAnchor, constant: -30).isActive = true
        sets.heightAnchor.constraint(equalToConstant: 50).isActive = true
        sets.topAnchor.constraint(equalTo: workoutTitle.bottomAnchor, constant: 20).isActive = true
        
        workoutTitle.text = workouts[indexPath.item].title
        
        alertController.setValue(alertViewController, forKey: "contentViewController")
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let submitAction = UIAlertAction(title: "Submit", style: .default) { _ in
            let reps = reps.text ?? ""
            let sets = sets.text ?? ""
            
            guard let userid = AuthHandler.shared.auth.currentUser?.uid else {
                print("no user id")
                return
            }
            
            guard let setsInt = Int(sets), let repsInt = Int(reps) else {
                print("reps and sets not converted to int")
                return
            }
            
            let progress = ProgressModel(
                id: "",
                workoutId: self.workouts[indexPath.item].id,
                workoutTitle: self.workouts[indexPath.item].title,
                workoutThumbURL: self.workouts[indexPath.item].thumbURL,
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
                
                self.didAddProgress()
                
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(submitAction)
        
        // Present the alert controller
        present(alertController, animated: true, completion: nil)
        
        
//        let vc = AddProgressViewController(workoutTitle: workouts[indexPath.item].title, workoutId: workouts[indexPath.item].id, workoutThumbURL: workouts[indexPath.item].thumbURL!)
//        present(vc, animated: true)
        
        //        let vc = ProgressDetailViewController(workout: workouts[indexPath.item])
        //        vc.hidesBottomBarWhenPushed = true
        //        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didAddProgress() {
        setupData()
    }
    
    func setupData(){
        workouts.removeAll()
        FirebaseDBHandler.shared.getWorkoutProgresses(level: "Beginner", equipment: false, goal: "Weight Loss") { [weak self] workouts in
            print("workoutprogresses: \(workouts)")
            self?.workouts = workouts
            DispatchQueue.main.async {
                self?.progressView.collection.reloadData()
            }
            
        }
    }
    
}

