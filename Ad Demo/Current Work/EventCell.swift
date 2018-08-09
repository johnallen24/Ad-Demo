//
//  EventCell.swift
//  Ad Demo
//
//  Created by John Allen on 8/2/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit

class EventCell: UICollectionViewCell {
    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.opacity = 0.3
        return iv
    }()
    
    let locationLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Bangalore"
        lb.textColor = UIColor.colorWithHexString("ffde1c")
        lb.textAlignment = .center
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 24)
        return lb
    }()
    
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Comic Con 2018"
        lb.textColor = UIColor.colorWithHexString("ffde1c")
        lb.textAlignment = .center
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 24)
        return lb
    }()
    
    let descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.text = "International music, rock"
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 15)
        return lb
    }()
    
    let dateLabel: UILabel = {
        let lb = UILabel()
        lb.text = "25 NOV"
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        return lb
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        
    
        addSubview(imageView)
        imageView.image = UIImage(named: "comiccon")
        addConstraintsWithFormat(format: "H:|[v0]|", views: imageView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: imageView)
        
        addSubview(locationLabel)
         addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(seperatorView)
        addSubview(dateLabel)
        
        
        addConstraintsWithFormat(format: "V:|-50-[v0(20)]-4-[v1(20)]-8-[v2(15)]-16-[v3(1)]-16-[v4(18)]", views: locationLabel,  nameLabel, descriptionLabel, seperatorView, dateLabel)
       
        addConstraintsWithFormat(format: "H:|[v0]|", views: locationLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: nameLabel)
         addConstraintsWithFormat(format: "H:|[v0]|", views: descriptionLabel)
        addConstraintsWithFormat(format: "H:|-120-[v0]-120-|", views: seperatorView)
        addConstraintsWithFormat(format: "H:|-120-[v0]-120-|", views: dateLabel)
        
        seperatorView.backgroundColor = UIColor.white
     
        
       
        

    }
    
}
