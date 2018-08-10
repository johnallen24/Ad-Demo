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
        extendedLayoutIncludesOpaqueBars = true
    
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
    
    let refreshControl: UIRefreshControl = {
       let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(exitDescriptionView), for: .valueChanged)
        rc.tintColor = UIColor.clear
        return rc
    }()
    
    let blurEffectView: UIVisualEffectView = {
         let bev = UIVisualEffectView(effect: nil)
        bev.translatesAutoresizingMaskIntoConstraints = false
        return bev
    }()
    
    let vibrancyEffectView: UIVisualEffectView = {
        let vev = UIVisualEffectView(effect: nil)
        vev.translatesAutoresizingMaskIntoConstraints = false
        return vev
    }()
    
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.contentSize.height = 1000
        return sv
    }()
    
    let eventDetailView: EventDetailView = {
        let edv = EventDetailView()
        return edv
    }()
    
    let coverView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    
    
    @objc func exitDescriptionView() {
        
         DispatchQueue.main.async {
        UIView.animate(withDuration: 0.3, animations: {
            self.vibrancyEffectView.effect = nil
            self.blurEffectView.effect = nil
            //self.descriptionContainerView.alpha = 0
            self.scrollView.alpha = 0
        }) { (bool) in
            self.refreshControl.endRefreshing()
            self.scrollView.refreshControl = nil
            self.refreshControl.removeFromSuperview()
            print(self.refreshControl.isRefreshing)
            self.blurEffectView.removeFromSuperview()
            self.eventDetailView.removeFromSuperview()
            self.scrollView.removeFromSuperview()
            
        }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("123")
        
        
        
       // let cell = collectionView.cellForItem(at: indexPath) as! EventCell
        
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        
       DispatchQueue.main.async {
        self.view.addSubview(self.blurEffectView)
        self.view.addConstraints([
            self.blurEffectView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.blurEffectView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.blurEffectView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.blurEffectView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
        
        self.blurEffectView.contentView.addSubview(self.vibrancyEffectView)
        self.view.addConstraintsWithFormat(format: "H:|[v0]|", views: self.vibrancyEffectView)
        self.view.addConstraintsWithFormat(format: "V:|[v0]|", views: self.vibrancyEffectView)

        self.view.addSubview(self.scrollView)
        self.scrollView.frame = self.view.frame
        self.scrollView.addSubview(self.refreshControl)

        let i = indexPath.row
        self.eventDetailView.locationLabel.text = EventsConstants.locations[i]
        self.eventDetailView.nameLabel.text = EventsConstants.names[i]
        self.eventDetailView.descriptionLabel.text = EventsConstants.briefDescriptions[i]
        self.eventDetailView.imageView.image = UIImage(named: EventsConstants.images[i])
        self.eventDetailView.timeLabel.text = EventsConstants.times[i]
        self.eventDetailView.addressLabel.text = EventsConstants.addresses[i]
        self.eventDetailView.webAddressLabel.text = EventsConstants.webAdresses[i]
        self.eventDetailView.synopsisLabel.text = EventsConstants.synopsises[i]
        
        self.scrollView.addSubview(self.eventDetailView)
        self.eventDetailView.frame = self.scrollView.frame
//        self.scrollView.addSubview(self.coverView)
//        self.coverView.frame = self.scrollView.contentSize
//        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.exitDescriptionView))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.scrollView.addGestureRecognizer(swipeRight)

        self.scrollView.alpha = 0
        }
       DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                self.vibrancyEffectView.effect = vibrancyEffect
                self.blurEffectView.effect = blurEffect
                self.scrollView.alpha = 1
            }) { (bool) in

            }
        }
     
       
    }
    

}
