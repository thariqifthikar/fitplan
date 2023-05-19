//
//  ProgressViewCell.swift
//  fitplan
//
//  Created by user230748 on 5/20/23.
//

import UIKit
import Kingfisher

class ProgressViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ProgressCell"
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        thumbnail.addSubview(rect)
        thumbnail.bringSubviewToFront(rect)
        
        addSubview(thumbnail)
        addSubview(title)
        
        thumbnail.heightAnchor.constraint(equalToConstant: 50).isActive = true
        thumbnail.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        thumbnail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        rect.heightAnchor.constraint(equalTo: thumbnail.heightAnchor).isActive = true
        rect.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        rect.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        title.widthAnchor.constraint(equalTo: thumbnail.widthAnchor, constant: -20).isActive = true
        title.leadingAnchor.constraint(equalTo: thumbnail.leadingAnchor, constant: 10).isActive = true
        title.topAnchor.constraint(equalTo: thumbnail.topAnchor, constant: -10).isActive = true
        title.heightAnchor.constraint(equalTo: thumbnail.heightAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with progress: ProgressModel) {
        progress.kf.setImage(with: progress.workoutThumbURL)
        title.text = progress.workoutTitle
    }
}

