//
//  PresentationCell.swift
//  Ad Demo
//
//  Created by John Allen on 8/7/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit

class PresentationCell: UICollectionViewCell {
    
    let timeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "1:00"
        //lb.textColor = UIColor.white
        lb.textAlignment = .left
        lb.adjustsFontSizeToFitWidth = true
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        return lb
    }()
    
    
    let rightSideContainer: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor.red
        return view
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    let bottomSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Electromagentism"
        //lb.adjustsFontSizeToFitWidth = true
        //lb.textColor = UIColor.white
        //lb.lineBreakMode = .byWordWrapping
        lb.numberOfLines = 0
        //lb.textAlignment = .natural
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        return lb
    }()

    let speakerLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Ted Carlson"
        //lb.textColor = UIColor.white
        lb.textAlignment = .left
        lb.font = UIFont(name: "AmericanTypewriter", size: 15)
        return lb
    }()

    override var isHighlighted: Bool {
        didSet {
            if self.isHighlighted 
            {
                self.contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
            }
            else
            {
                self.contentView.backgroundColor = UIColor.white
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(timeLabel)
        addSubview(seperatorView)
        addSubview(rightSideContainer)
        
        
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-[v1(1)]-8-[v2]|", views: timeLabel, seperatorView, rightSideContainer)
        
        let width = timeLabel.intrinsicContentSize.width
        //let width = timeLabel.text?.sizeOfString(usingFont: timeLabel.font!).width
        addConstraint(timeLabel.widthAnchor.constraint(equalToConstant: width))
        
        addConstraintsWithFormat(format: "V:|[v0]|", views: timeLabel)
        addConstraintsWithFormat(format: "V:|-16-[v0]-24-|", views: seperatorView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: rightSideContainer)
        seperatorView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        rightSideContainer.addSubview(titleLabel)
        rightSideContainer.addSubview(speakerLabel)
        addConstraintsWithFormat(format: "V:|-16-[v0(50)]-8-[v1(20)]", views: titleLabel, speakerLabel)
       //titleLabel.backgroundColor = UIColor.orange
        addConstraintsWithFormat(format: "H:|[v0]-8-|", views: titleLabel)
        addConstraintsWithFormat(format: "H:|[v0]-8-|", views: speakerLabel)

        
//        addSubview(bottomSeperatorView)
//        addConstraintsWithFormat(format: "V:[v0(1)]|", views: bottomSeperatorView)
//        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: bottomSeperatorView)
//        bottomSeperatorView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        
    }
    
}
