//
//  ProgressViweController.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit

class ProgressViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let progressview = ProgressView();
//        var progressArray: [ProgressModel] = [
//            ProgressModel(
//            workoutId: "tzEet50gRgIblz4rzZqY",
//            workoutTitle: "Jumping Jacks",
//            workoutThumbURL: URL(string: "https://firebasestorage.googleapis.com/v0/b/fitplan-3d2cc.appspot.com/o/jumpingjacks_thumb.jpg?alt=media&token=ee9b1891-4d88-4afc-a3a3-055f2ed1a946"),
//            userId: "gQwtEfIVL8c7xl5NRWmKplY7l372",
//            sets: 2,
//            reps: 10,
//            timestamp: Date().timeIntervalSince1970)
//        ]
    
    var progressArray: [ProgressModel] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(progressview)
        
        progressview.collection.dataSource = self
        progressview.collection.delegate = self
        guard let userid: String = AuthHandler.shared.auth.currentUser?.uid else {
            print("no user id")
            return
        }
        
        FirebaseDBHandler.shared
            .getProgresses(userid: userid) { [weak self] progressArray in
            print("workouts: /(workouts.count)")
            self?.progressArray = progressArray
            DispatchQueue.main.async {
                self?.progressview.collection.reloadData()
            }

        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        progressview.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return progressArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressViewCell.reuseIdentifier, for: indexPath) as! ProgressViewCell
        cell.configure(with: progressArray[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width
        return CGSize(width: itemWidth, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ProgressDetailViewController(item: progressArray[indexPath.item])
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
    
}


