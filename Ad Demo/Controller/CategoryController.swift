//
//  ViewController.swift
//  Ad Demo
//
//  Created by John Allen on 7/31/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit
import CoreLocation

class CategoryController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var locationManager: CLLocationManager!
    var region1: CLBeaconRegion!
    var region2: CLBeaconRegion!
    var region3: CLBeaconRegion!
    
    
    var categoryNames = ["Movies", "Food", "Drinks", "Events"]
    var categoryImageNames = ["movie-category", "food-category2", "drink-category2", "event-category"]
    
//    var categories: [Category]  = {
//        for title in categoryTitles {
//            let imageName = categoryImageNames
//        }
//    }()
    
    let categoriesCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Demo"
        
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "cellID")
        
       // setupBeacons()
        setupViews()
        
    }

//    func setupBeacons() {
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
//        locationManager.requestAlwaysAuthorization()
//        region1 = CLBeaconRegion(proximityUUID: UUID(uuidString:
//            "4A3195B0-5D24-4C0B-A697-A02FA330CD54")!, identifier: "lobby")
//        locationManager.startMonitoring(for: region1)
//        region2 = CLBeaconRegion(proximityUUID: UUID(uuidString: "F6E58F0A-59B7-45A6-AE9E-FAC84366B1DB")!, identifier: "gym")
//        locationManager.startMonitoring(for: region2)
//        region3 = CLBeaconRegion(proximityUUID: UUID(uuidString: "ED73248E-D944-4192-98B9-6099FB5DECFE")!, identifier: "pool")
//        locationManager.startMonitoring(for: region3)
//    }
    
    func setupViews() {
        view.addSubview(categoriesCollectionView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: categoriesCollectionView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: categoriesCollectionView)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CategoryCell
        cell.backgroundColor = UIColor.black
        cell.imageView.image = UIImage(named: categoryImageNames[indexPath.item])
        cell.nameLabel.text = categoryNames[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item % 3 == 0 {
            return CGSize(width: view.frame.width, height: 200)
        }
        else {
            return CGSize(width: (view.frame.width / 2) - 1, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = CardsController()
        controller.category = getCategory(index: indexPath.item)
        navigationController?.pushViewController(controller, animated: true)
    }

    func getCategory(index: Int) -> Category {
        
        switch index {
        case 0:
            return Category.movie
        case 1:
            return Category.food
        case 2:
            return Category.drink
        case 3:
            return Category.event
        default:
            fatalError("There is no category for this!!!")
        }
    }
    
}


extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

