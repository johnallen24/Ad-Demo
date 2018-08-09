//
//  ConferenceController.swift
//  Ad Demo
//
//  Created by John Allen on 8/7/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit

class PresentationController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    
    let presentationsCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    let roomImageView: UIImageView = {
        let iv = UIImageView()
        //iv.backgroundColor = UIColor.black
        iv.layer.opacity = 0.5
        return iv
    }()
    
    let roomDescriptionLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = UIColor.white
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.font = UIFont(name: "Helvetica-Bold", size: 25)
        return lb
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.presentationController = self
        
        presentationsCollectionView.delegate = self
        presentationsCollectionView.dataSource = self
        presentationsCollectionView.register(PresentationCell.self, forCellWithReuseIdentifier: "cellID")
        
        checkData()

        setupViews()
    }

    func setupViews() {
        view.addSubview(roomImageView)
        view.addSubview(presentationsCollectionView)
        view.addConstraintsWithFormat(format: "V:[v0(200)][v1]|", views: roomImageView, presentationsCollectionView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: roomImageView)
         view.addConstraintsWithFormat(format: "H:|[v0]|", views: presentationsCollectionView)
        NSLayoutConstraint.activate([
            roomImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            ])
        
        view.addSubview(roomDescriptionLabel)
//        view.addConstraintsWithFormat(format: "V:|[v0]|", views: roomDescriptionLabel)
//        view.addConstraintsWithFormat(format: "H:|[v0]|", views: roomDescriptionLabel)
       roomDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roomDescriptionLabel.topAnchor.constraint(equalTo: roomImageView.topAnchor),
            roomDescriptionLabel.bottomAnchor.constraint(equalTo: roomImageView.bottomAnchor),
            roomDescriptionLabel.leadingAnchor.constraint(equalTo: roomImageView.leadingAnchor),
            roomDescriptionLabel.trailingAnchor.constraint(equalTo: roomImageView.trailingAnchor)
            ])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topics.count 
    }
    
    var location: String? {
        didSet {
            if location != nil {
                if let topics = PresentationConstants.getTopics(forLocation: location!), let speakers = PresentationConstants.getSpeakers(forLocation: location!), let roomImageName = PresentationConstants.roomPictures[location!] {
                    self.topics = topics
                    self.speakers = speakers
                    self.roomImageView.image = UIImage(named: roomImageName)
                    roomDescriptionLabel.text = PresentationConstants.rooms[location!]
                    view.backgroundColor = UIColor.black
                }
                else {
                    print("Error: could not get topics or speakers from location")
                }
            }
        }
    }
    
    let times = ["7:00", "8:30", "9:30", "1:00", "2:30", "4:00", "5:30"]
    var topics: [String] = []
    var speakers: [String] = []
    
    
    //Note: once all locations have been found, the last location found will no longer be the last location due to the fact that the key "currentLocations2" will not add anymore values(no duplicates) - should fix this but no time right now
    
    func checkData() {
        let userDefault = UserDefaults.standard
        let locations = userDefault.value(forKey: "currentLocations2") as! [String]
        self.location = locations.last
    }
    
    func reloadData() {
        checkData()
        DispatchQueue.main.async {
            self.presentationsCollectionView.reloadData()
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! PresentationCell
        cell.timeLabel.text = times[indexPath.item]
        cell.speakerLabel.text = speakers[indexPath.item]
        cell.titleLabel.text = topics[indexPath.item]
        return cell 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("123")
    }
}
