//
//  ViewController.swift
//  fitplan
//
//  Created by user230748 on 5/13/23.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let homeView = HomeView();
    
    var workouts: [WorkoutDetailModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("homevc")
        view.backgroundColor = .systemBackground
        view.addSubview(homeView)
        
        homeView.collection.dataSource = self
        homeView.collection.delegate = self
        
        FirebaseDBHandler.shared.getWorkouts(level: "Beginner", equipment: false, goal: "Weight Loss") { [weak self] workouts in
            print("workouts: \(workouts.count)")
            self?.workouts = workouts
            DispatchQueue.main.async {
                self?.homeView.collection.reloadData()
            }

        }
        
        print(homeView.collection.contentSize)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        homeView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkoutViewCell.reuseIdentifier, for: indexPath) as! WorkoutViewCell
        cell.configure(with: workouts[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width
        return CGSize(width: itemWidth, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = WorkoutDetailsViewController(item: workouts[indexPath.item])
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

