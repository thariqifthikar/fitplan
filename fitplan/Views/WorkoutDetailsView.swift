//
//  UserDetailsView.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit
import YouTubeiOSPlayerHelper

class WorkoutDetailsView: UIView {
    
    public let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    public let subtitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let repslabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .systemOrange
        label.text = "Reps"
        return label
    }()
    
    private let setslabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .systemOrange
        label.text = "Sets"
        return label
    }()
    
    public let reps: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    public let sets: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let bodypartlabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemOrange
        label.text = "Effective Body Parts"
        label.numberOfLines = 0
        return label
    }()
    
    public let bodypart: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    public let bodypartimg: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        return image
    }()
    
    public let video: YTPlayerView = {
        let video = YTPlayerView()
        video.backgroundColor = .black
        video.isUserInteractionEnabled = true
        video.layer.cornerRadius = 10
        video.translatesAutoresizingMaskIntoConstraints = false
        return video
    }()
    
    private let scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.alwaysBounceVertical = true // Enable vertical scrolling
        scroll.isScrollEnabled = true
        scroll.contentSize = CGSize(width: scroll.frame.width, height: 1000)
        scroll.showsVerticalScrollIndicator = true // Show vertical scroll indicator
        return scroll
    }()
    
    private let cardMain: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private let repsholder: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let setsholder: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let repsetsholder: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let bodypartholder: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        repsholder.insertArrangedSubview(repslabel, at: 0)
        repsholder.insertArrangedSubview(reps, at: 1)
        
        setsholder.insertArrangedSubview(setslabel, at: 0)
        setsholder.insertArrangedSubview(sets, at: 1)
        
        repsetsholder.insertArrangedSubview(repsholder, at: 0)
        repsetsholder.insertArrangedSubview(setsholder, at: 1)
        
        bodypartholder.insertArrangedSubview(bodypartlabel, at: 0)
        bodypartholder.insertArrangedSubview(bodypart, at: 1)
        bodypartholder.insertArrangedSubview(bodypartimg, at: 2)
        
        cardMain.insertArrangedSubview(subtitle, at: 0)
        cardMain.insertArrangedSubview(repsetsholder, at: 1)
        cardMain.insertArrangedSubview(bodypartholder, at: 2)
        
        scroll.addSubview(cardMain)
        
        addSubview(title)
        addSubview(video)
        addSubview(scroll)
        
        title.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        video.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        video.heightAnchor.constraint(equalToConstant: 200).isActive = true
        video.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        video.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        
        scroll.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        scroll.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scroll.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        scroll.topAnchor.constraint(equalTo: video.bottomAnchor, constant: 10).isActive = true
        
        subtitle.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        subtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        repslabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -15).isActive = true
        repslabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        reps.widthAnchor.constraint(equalTo: repslabel.widthAnchor).isActive = true
        reps.leadingAnchor.constraint(equalTo: repslabel.leadingAnchor).isActive = true
        
        setslabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -15).isActive = true
        setslabel.leadingAnchor.constraint(equalTo: repslabel.trailingAnchor).isActive = true
        
        sets.widthAnchor.constraint(equalTo: setslabel.widthAnchor).isActive = true
        sets.leadingAnchor.constraint(equalTo: setslabel.leadingAnchor).isActive = true
        
        bodypartlabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        bodypartlabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        bodypart.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        bodypart.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        
        bodypartimg.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        bodypartimg.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        bodypartimg.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        cardMain.layoutIfNeeded()
        let dataheight = cardMain.arrangedSubviews.reduce(0) { $0 + $1.frame.height }
        scroll.contentSize = CGSize(width: scroll.bounds.width, height: dataheight*0.7)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
