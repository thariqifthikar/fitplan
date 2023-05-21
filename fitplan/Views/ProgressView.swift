//
//  ProgressView.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit

class ProgressView: UIView {
    
    public let collection: UICollectionView
    
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        return layout
    }()
    
    override init(frame: CGRect) {
        
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(WorkoutProgressViewCell.self, forCellWithReuseIdentifier: WorkoutProgressViewCell.reuseIdentifier)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(frame: frame)
        
        addSubview(collection)
        
        collection.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collection.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

