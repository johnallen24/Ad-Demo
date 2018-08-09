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
    
    let detailPopUpView: UIView = {
        let view = UIView()
        return view
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
    
    
    let images = ["comiccon", "yoga", "benandjerrys", "comiccon", "yoga"]
    let locations = ["Hynes Convention Center", "Boston Public Garden","Ben and Jerry's", "Hynes Convention Center", "Boston Public Garden"]
    let names = ["Comic Con 2018", "Yoga in the Park", "National Ice Cream Day", "Comic Con 2018", "Yoga in the Park"]
    let descriptions = ["International music, rock" , "Exercise, meditation", "Free food, music" , "International music, rock" , "Exercise, meditation"]
    let dates = ["10 AUG", "6 AUG","3 AUG", "10 AUG", "6 AUG"]
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! EventCell
        cell.imageView.image = UIImage(named: images[indexPath.item])
        cell.locationLabel.text = locations[indexPath.item]
        cell.nameLabel.text = names[indexPath.item]
        cell.descriptionLabel.text = descriptions[indexPath.item]
        cell.dateLabel.text = dates[indexPath.item]
        cell.backgroundColor = UIColor.black
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: view.frame.width, height: 185)
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("123")
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(frame: view.frame)
       
       
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyEffectView = UIVisualEffectView(frame: blurEffectView.frame)
       
        view.addSubview(blurEffectView)
         blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            blurEffectView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            blurEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        blurEffectView.contentView.addSubview(vibrancyEffectView)
        blurEffectView.effect = nil
        vibrancyEffectView.effect = nil
        
        
        DispatchQueue.main.async {
        
        let eventDetailView = EventDetailView()
           
            eventDetailView.locationLabel.layer.zPosition = 1
        vibrancyEffectView.contentView.addSubview(eventDetailView)
        eventDetailView.frame = vibrancyEffectView.contentView.frame
        eventDetailView.alpha = 0
       
            UIView.animate(withDuration: 0.3, animations: {
                vibrancyEffectView.effect = vibrancyEffect
                blurEffectView.effect = blurEffect
                eventDetailView.alpha = 1
            }) { (bool) in
               
            }
        }
     
       
    }
    

}
