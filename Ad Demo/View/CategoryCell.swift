//
//  CategoryCell.swift
//  Ad Demo
//
//  Created by John Allen on 7/31/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    
    
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Movies"
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 30) //UIFont(name: "MarkerFelt-Wide", size: 30)
        return lb
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.opacity = 0.5
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(imageView)
        imageView.image = UIImage(named: "avengers")
        addConstraintsWithFormat(format: "V:|[v0]|", views: imageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: imageView)
        
        
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.widthAnchor.constraint(equalToConstant: 140)
            ])
    }
    
}
