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
    
    private let rectMain: UIView = {
        let rect = UIView()
        rect.backgroundColor = .systemBackground
        rect.layer.cornerRadius = 10
        rect.translatesAutoresizingMaskIntoConstraints = false
        return rect
    }()
    
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
        label.numberOfLines = 1
        return label
    }()
    
    private let progressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 1
        label.text = "Reps Progress"
        return label
    }()
    
    private let progress: UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = .green
        progress.trackTintColor = .lightGray
        progress.progress = 0
        progress.layer.cornerRadius = 10
        return progress
    }()
    
    private let progHolder: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.backgroundColor = .clear
        stackView.spacing = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        thumbnail.addSubview(rect)
        thumbnail.bringSubviewToFront(rect)
        
        progHolder.insertArrangedSubview(progressLabel, at: 0)
        progHolder.insertArrangedSubview(progress, at: 1)
        
        addSubview(rectMain)
        addSubview(thumbnail)
        addSubview(title)
        addSubview(progHolder)
        
        rectMain.heightAnchor.constraint(equalToConstant: 150).isActive = true
        rectMain.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        rectMain.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        thumbnail.heightAnchor.constraint(equalToConstant: 100).isActive = true
        thumbnail.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        thumbnail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        rect.heightAnchor.constraint(equalTo: thumbnail.heightAnchor).isActive = true
        rect.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        rect.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        title.widthAnchor.constraint(equalTo: thumbnail.widthAnchor, constant: -20).isActive = true
        title.leadingAnchor.constraint(equalTo: thumbnail.leadingAnchor, constant: 10).isActive = true
        title.bottomAnchor.constraint(equalTo: thumbnail.bottomAnchor, constant: -10).isActive = true
        
        progHolder.topAnchor.constraint(equalTo: thumbnail.bottomAnchor).isActive = true
        progHolder.heightAnchor.constraint(equalToConstant: 50).isActive = true
        progHolder.widthAnchor.constraint(equalTo: rectMain.widthAnchor).isActive = true
        
        progressLabel.centerYAnchor.constraint(equalTo: progHolder.centerYAnchor).isActive = true
        
        progress.centerYAnchor.constraint(equalTo: progHolder.centerYAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with progress: ProgressModel) {
        thumbnail.kf.setImage(with: progress.workoutThumbURL)
        title.text = progress.workoutTitle
    }
}
