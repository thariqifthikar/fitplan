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
    
    private let datetime: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
        
    private let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    private let progressPerc: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(datetime)
        addSubview(title)
        addSubview(progressPerc)
        
        datetime.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        datetime.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        datetime.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        
        title.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        title.topAnchor.constraint(equalTo: datetime.bottomAnchor, constant: 5).isActive = true
        
        progressPerc.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        progressPerc.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        progressPerc.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with progress: ProgressModel, targetSets: Int, targtetReps: Int) {
        
        let date = Date(timeIntervalSince1970: progress.timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss dd-MM-yyyy"
        let formattedDate = dateFormatter.string(from: date)
        datetime.text = formattedDate
        title.text = progress.workoutTitle

        let totalTargetReps = targetSets * targtetReps
        let totalReps = progress.reps * progress.sets
        let progressPercentage = totalReps / totalTargetReps * 100
        progressPerc.text = "\(progressPercentage)%"
    }
}
