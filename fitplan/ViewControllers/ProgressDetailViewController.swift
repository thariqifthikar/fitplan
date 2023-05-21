//
//  ProgressDetailViewController.swift
//  fitplan
//
//  Created by user230748 on 5/20/23.
//

import UIKit

class ProgressDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    private let progressDetailView = ProgressDetailsView();
    private let workout: WorkoutProgressModel
    private let progresses: [ProgressModel]
    
    init(workout: WorkoutProgressModel) {
        self.workout = workout
        self.progresses = workout.progresses
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(progressDetailView)
//
        progressDetailView.collection.dataSource = self
        progressDetailView.collection.delegate = self
        
        progressDetailView.title.text = workout.title
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Progress", style: .done, target: self, action: #selector(addProgressAction))
        
        setupData()
    }
    
    private func setupData(){
        
        var repsSets = 0
        
        for progress in progresses {
            let reps = progress.reps
            let sets = progress.sets
            let thisRepSets = reps * sets
            
            repsSets+=thisRepSets
            DispatchQueue.main.async {
                self.progressDetailView.currentReps.text = String(repsSets)
            }
            
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        progressDetailView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
    func didAddProgress() {
        setupData()
    }
    
    @objc private func addProgressAction(){
        
        guard let thumb = workout.thumbURL else {
            
            return
        }
        
        let vc = AddProgressViewController(workoutTitle: workout.title, workoutId: workout.id, workoutThumbURL: thumb)
        vc.navigationItem.largeTitleDisplayMode = .never
        present(vc, animated: true)
    }
    
    func addProgress(workoutTitle:String, workoutId: String, workoutThumbURL: URL){
        let addProgress = AddProgressViewController(workoutTitle: workoutTitle, workoutId: workoutId, workoutThumbURL: workoutThumbURL)
//        addProgress.delegate = self
        present(addProgress, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return progresses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressViewCell.reuseIdentifier, for: indexPath) as! ProgressViewCell
        cell.configure(with: progresses[indexPath.item], targetSets: Int(workout.setCount), targtetReps: Int(workout.repCount))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width
        return CGSize(width: itemWidth, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let date = Date(timeIntervalSince1970: progresses[indexPath.item].timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss dd-MM-yyyy"
        let formattedDate = dateFormatter.string(from: date)
        
        let alertController = UIAlertController(title: "Delete Progress", message: "Are you sure you want to delete your progress recorded at \(formattedDate)?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            FirebaseDBHandler.shared.removeProgress(progressId: self.progresses[indexPath.item].id) { success in
                guard success else {
                    print("delete failed for progress")
                    return
                }
            }

            self.setupData()
        }

        alertController.addAction(deleteAction)

        present(alertController, animated: true, completion: nil)
        
    }
    
}
