//
//  ProgressViewCell.swift
//  fitplan
//
//  Created by user230748 on 5/20/23.
//

import UIKit
import Kingfisher

class WorkoutProgressViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "WorkoutProgressCell"
        
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
    
    private let progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = .green
        progress.trackTintColor = UIColor.lightGray.withAlphaComponent(0.8)
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progress = 0
        return progress
    }()
    
    private let progHolder: UIView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.backgroundColor = .clear
        stackView.spacing = 10
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        thumbnail.addSubview(rect)
        thumbnail.bringSubviewToFront(rect)
        
        progHolder.addSubview(progressView)
        
        addSubview(thumbnail)
        addSubview(title)
        addSubview(progHolder)
        
        thumbnail.heightAnchor.constraint(equalToConstant: 150).isActive = true
        thumbnail.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        thumbnail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        thumbnail.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        
        rect.heightAnchor.constraint(equalTo: thumbnail.heightAnchor).isActive = true
        rect.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        rect.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        title.widthAnchor.constraint(equalTo: thumbnail.widthAnchor, constant: -20).isActive = true
        title.leadingAnchor.constraint(equalTo: thumbnail.leadingAnchor, constant: 10).isActive = true
        title.bottomAnchor.constraint(equalTo: progHolder.topAnchor, constant: -10).isActive = true
        
        progHolder.bottomAnchor.constraint(equalTo: thumbnail.bottomAnchor, constant: -10).isActive = true
        progHolder.heightAnchor.constraint(equalToConstant: 20).isActive = true
        progHolder.widthAnchor.constraint(equalTo: thumbnail.widthAnchor, constant: -20).isActive = true
        progHolder.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        
        progressView.centerYAnchor.constraint(equalTo: progHolder.centerYAnchor).isActive = true
        progressView.widthAnchor.constraint(equalTo: progHolder.widthAnchor).isActive = true
        progressView.heightAnchor.constraint(equalTo: progHolder.heightAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with workoutProgress: WorkoutProgressModel) {
        
        thumbnail.kf.setImage(with: workoutProgress.thumbURL)
        title.text = workoutProgress.title
        
        let totalTargetReps = workoutProgress.repCount * workoutProgress.setCount * 5
        var totalCurrentReps = 0.0
        var repsProgress = 0.0
        
        for progress in workoutProgress.progresses {
            let thisReps = progress.reps * progress.sets
            totalCurrentReps+=Double(thisReps)
            
            repsProgress = totalCurrentReps / totalTargetReps
            progressView.progress = Float(repsProgress)
        }
    }
}
