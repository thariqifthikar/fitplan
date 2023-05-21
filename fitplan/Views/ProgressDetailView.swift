//
//  ProgressDetailView.swift
//  fitplan
//
//  Created by user230748 on 5/20/23.
//

import UIKit

class ProgressDetailsView: UIView {
    
    public let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let targetRepsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Reps x Sets for 30 Days"
        return label
    }()
    
    public let targetReps: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .systemOrange
        return label
    }()
    
    private let currentRepsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Current Reps x Sets"
        return label
    }()
    
    public let currentReps: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .systemOrange
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
    
    public let progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = .green
        progress.trackTintColor = .lightGray
        progress.progress = 0
        progress.layer.cornerRadius = 10
        return progress
    }()
    
    public let collection: UICollectionView
    
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        return layout
    }()
    
    private let targetHolder: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let currentHolder: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let currentTargetHolder: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ProgressViewCell.self, forCellWithReuseIdentifier: ProgressViewCell.reuseIdentifier)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(frame: frame)
        
        targetHolder.insertArrangedSubview(targetRepsLabel, at: 0)
        targetHolder.insertArrangedSubview(targetReps, at: 1)
        
        currentHolder.insertArrangedSubview(currentHolder, at: 0)
        currentHolder.insertArrangedSubview(currentReps, at: 1)
        
        currentTargetHolder.insertArrangedSubview(targetHolder, at: 0)
        currentTargetHolder.insertArrangedSubview(currentHolder, at: 1)
        
        addSubview(title)
        addSubview(currentTargetHolder)
        addSubview(progressLabel)
        addSubview(progressView)
        addSubview(collection)
        
        title.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        title.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        
        currentTargetHolder.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        currentTargetHolder.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20).isActive = true
        currentTargetHolder.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        progressLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        progressLabel.topAnchor.constraint(equalTo: currentTargetHolder.bottomAnchor, constant: 10).isActive = true
        progressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        progressView.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        progressView.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 5).isActive = true
        progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        collection.topAnchor.constraint(equalTo: progressView.topAnchor, constant: 10).isActive = true
        collection.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collection.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collection.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
