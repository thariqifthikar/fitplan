//
//  ViewController.swift
//  fitplan
//
//  Created by user230748 on 5/13/23.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let homeView = HomeView();
    var workouts: [WorkoutModel] = [
        WorkoutModel(id: "1", title: "Dumbbell Squat to Shoulder Press", thumbURL: URL(string: "https://www.muscleandfitness.com/wp-content/uploads/2018/02/FrontSquatPress-MU.jpg?quality=86&strip=all"), description: "Hold dumbbells at shoulder height, perform a squat, and as you stand up, press the dumbbells overhead. Lower the dumbbells back to the shoulder position and repeat"),
        WorkoutModel(id: "2", title: "Jumping Jacks", thumbURL: URL(string: "https://post.greatist.com/wp-content/uploads/sites/2/2020/04/GRT-two-people-jumping-jacks-1200x628-facebook-1200x628.jpg"), description: "Stand with feet together, then jump while spreading your legs and raising your arms overhead. Jump again to return to the starting position"),
        WorkoutModel(id: "3", title: "Barbell Bench Press (Incline or Decline)", thumbURL: URL(string: "https://qph.cf2.quoracdn.net/main-qimg-d80b078f955fa2e107023ad547b57e7e-lq"), description: "Lie on an incline or decline bench with a barbell held at shoulder level. Lower the barbell to your chest, then press it back up to the starting position.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(homeView)
        
        homeView.collection.dataSource = self
        homeView.collection.delegate = self
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
        let vc = WorkoutDetailsViewController()
        print(vc)
        vc.workouttitle = workouts[indexPath.item].title
        present(vc, animated: true)
    }
    
}

