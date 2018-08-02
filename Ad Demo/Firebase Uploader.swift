//
//  Firebase Uploader.swift
//  Ad Demo
//
//  Created by John Allen on 8/1/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit
import Firebase

class Firebase_Uploader: UIViewController {

    let uuids = ["4A3195B0-5D24-4C0B-A697-A02FA330CD54", "F6E58F0A-59B7-45A6-AE9E-FAC84366B1DB", "ED73248E-D944-4192-98B9-6099FB5DECFE"]
    let categories = ["location", "movies", "food", "drink", "events"]
    let locations = ["Lobby", "Gym", "Pool"]
    let items = ["ex1", "ex2","ex3","ex4","ex5","ex6"]
    let names = ["Red Lobster", "P.F. Chang's", "McDonalds", "Mike's Pastries", "Qdoba", "Olive Garden"]
    let discounts = ["30% off","30% off","30% off","30% off","30% off","30% off"]
    let desciptions = ["any pasta entree","any pasta entree","any pasta entree","any pasta entree","any pasta entree","any pasta entree"]
    let expirations = ["8/20/18","8/20/18","8/20/18","8/20/18","8/20/18","8/20/18"]


    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference(withPath: "uuids")
        
        var i = 0
        for uuid in uuids {
            for category in categories  {
                switch category {
                case "location":
                    let path = "\(uuid)/location"
                    ref.child(path).setValue(locations[i])
                case "movies":
                    print("movies")
                case "food":
                    var j = 0
                    for item in items {
                        let path = "\(uuid)/food/\(item)"
                        let values: [String: Any] = ["name":names[j], "logourl": "url...", "discount": discounts[j], "description": desciptions[j], "expiration": expirations[j], "qrcodeurl": "url..."]
                        ref.child(path).updateChildValues(values)
                        j += 1
                    }
                case "drink":
                    print("drink")
                case "events":
                    print("events")
                default:
                    print("default")
                }
                
                if category == "location" {
                
                continue
                }
                
            }
            i += 1
        }
        
      
    }

    
    

}
