//
//  UserDetailsView.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import UIKit
import WebKit
import AVFoundation

class WorkoutDetailsView: UIView {
    
    var videoURL: URL
    
    public let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    public let video: WKWebView = {
        let video = WKWebView()
        return video
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        addSubview(title)
        title.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        title.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        
        video.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
        video.heightAnchor.constraint(equalToConstant: 200).isActive = true
        video.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        video.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
