//
//  EventsController.swift
//  Ad Demo
//
//  Created by John Allen on 8/2/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit

class EventsController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    let eventsCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = UIColor.black
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        eventsCollectionView.register(EventCell.self, forCellWithReuseIdentifier: "cellID")
        
        setupViews()
    
    }
    
    func setupViews() {
        
        view.addSubview(eventsCollectionView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: eventsCollectionView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: eventsCollectionView)
     
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        cell.backgroundColor = UIColor.black
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: view.frame.width, height: 185)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    
    
}
