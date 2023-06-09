//
//  WorkoutViewCell.swift
//  fitplan
//
//  Created by user230748 on 5/18/23.
//

import UIKit
import Kingfisher

class WorkoutViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "WorkoutCell"
    
    private let thumbnail: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        return image
    }()
    
    private let rect: UIView = {
        let rect = UIView()
        rect.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        rect.layer.cornerRadius = 10
        rect.translatesAutoresizingMaskIntoConstraints = false
        return rect
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    private let descript: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        thumbnail.addSubview(rect)
        thumbnail.bringSubviewToFront(rect)
        
        addSubview(thumbnail)
        addSubview(title)
        addSubview(descript)
        
        thumbnail.heightAnchor.constraint(equalToConstant: 150).isActive = true
        thumbnail.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        thumbnail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        rect.heightAnchor.constraint(equalTo: thumbnail.heightAnchor).isActive = true
        rect.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        rect.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        descript.widthAnchor.constraint(equalTo: thumbnail.widthAnchor, constant: -20).isActive = true
        descript.leadingAnchor.constraint(equalTo: thumbnail.leadingAnchor, constant: 10).isActive = true
        descript.bottomAnchor.constraint(equalTo: thumbnail.bottomAnchor, constant: -10).isActive = true
        
        title.widthAnchor.constraint(equalTo: thumbnail.widthAnchor, constant: -20).isActive = true
        title.leadingAnchor.constraint(equalTo: thumbnail.leadingAnchor, constant: 10).isActive = true
        title.bottomAnchor.constraint(equalTo: descript.topAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with workout: WorkoutDetailModel) {
        thumbnail.kf.setImage(with: workout.thumbURL)
        title.text = workout.title
        descript.text = workout.description
    }
}
