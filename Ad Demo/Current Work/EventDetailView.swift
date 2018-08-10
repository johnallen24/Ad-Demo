//
//  EventDetailView.swift
//  Ad Demo
//
//  Created by John Allen on 8/9/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit

class EventDetailView: UIView {
    
//    let scrollView: UIScrollView = {
//        let sv = UIScrollView()
//        //sv.contentSize.height = 2000
//        return sv
//    }()
    
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
    
    let seperatorView1: UIView = {
        let view = UIView()
        return view
    }()
    
    let topContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let bottomContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    let timeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "5:00 PM - 9:30 PM"
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        return lb
    }()
    
    let seperatorView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let addressLabel: UILabel = {
        let lb = UILabel()
        lb.text = "900 Boylston St,\nBoston, MA"
        lb.numberOfLines = 0
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        return lb
    }()
    
    let seperatorView3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let webAddressLabel: UILabel = {
        let lb = UILabel()
        lb.text = "www.comic-con.org"
        lb.textColor = UIColor.colorWithHexString("ffde1c")
        lb.textAlignment = .center
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        return lb
    }()
    
    let someLabel: UILabel = {
        let lb = UILabel()
        lb.text = "hello!!!"
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        return lb
    }()
    
    let synposisTitleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Synopsis"
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        return lb
    }()
    
    let synopsisLabel: UILabel = {
        let lb = UILabel()
        lb.text = "hey"
        lb.textColor = UIColor.white
        lb.textAlignment = .center
        lb.numberOfLines = 0
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        return lb
    }()
    
    


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        
        addSubview(topContainer)
        addSubview(imageView)
        addSubview(bottomContainer)
        addSubview(synposisTitleLabel)
        addSubview(synopsisLabel)
        addConstraintsWithFormat(format: "V:|[v0(185)]-32-[v1(185)]-32-[v2(185)]-32-[v3(20)]-16-[v4(200)]", views: topContainer, imageView, bottomContainer, synposisTitleLabel, synopsisLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: topContainer)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: imageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: bottomContainer)
         addConstraintsWithFormat(format: "H:|[v0]|", views: synposisTitleLabel)
        addConstraintsWithFormat(format: "H:|-32-[v0]-32-|", views: synopsisLabel)
        imageView.image = UIImage(named: "comiccon")
        
        setupTopContainer()
        setupBottomContainer()
        
    }
    
    func setupTopContainer() {
        topContainer.addSubview(locationLabel)
        topContainer.addSubview(nameLabel)
        topContainer.addSubview(descriptionLabel)
        topContainer.addSubview(seperatorView1)
        topContainer.addSubview(dateLabel)
        
        
        addConstraintsWithFormat(format: "V:|-50-[v0(20)]-4-[v1(20)]-8-[v2(15)]-16-[v3(1)]-16-[v4(18)]", views: locationLabel,  nameLabel, descriptionLabel, seperatorView1, dateLabel)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: locationLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: nameLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: descriptionLabel)
        addConstraintsWithFormat(format: "H:|-120-[v0]-120-|", views: seperatorView1)
        addConstraintsWithFormat(format: "H:|-120-[v0]-120-|", views: dateLabel)
    }
    
    func setupBottomContainer() {
        bottomContainer.addSubview(timeLabel)
        bottomContainer.addSubview(seperatorView2)
        bottomContainer.addSubview(addressLabel)
        bottomContainer.addSubview(seperatorView3)
        bottomContainer.addSubview(webAddressLabel)
        
        addConstraintsWithFormat(format: "V:|[v0(18)]-16-[v1(0.5)]-16-[v2(40)]-16-[v3(0.5)]-16-[v4(16)]", views: timeLabel, seperatorView2, addressLabel, seperatorView3, webAddressLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: timeLabel)
        addConstraintsWithFormat(format: "H:|-64-[v0]-64-|", views: seperatorView2)
         addConstraintsWithFormat(format: "H:|[v0]|", views: addressLabel)
        addConstraintsWithFormat(format: "H:|-64-[v0]-64-|", views: seperatorView3)
        addConstraintsWithFormat(format: "H:|[v0]|", views: webAddressLabel)
        
    }
    
}
