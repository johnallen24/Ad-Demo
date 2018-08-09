//
//  AppDelegate.swift
//  Ad Demo
//
//  Created by John Allen on 7/31/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation

@UIApplicationMain 
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let locationManager = CLLocationManager()
    var cardsController: CardsController?
    var presentationController: PresentationController?
    var region1: CLBeaconRegion!
    var region2: CLBeaconRegion!
    var region3: CLBeaconRegion!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool { 
        FirebaseApp.configure()
        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization()
        region1 = CLBeaconRegion(proximityUUID: UUID(uuidString:
            "7A05510F-EEB8-4795-AAB7-611A18EBEA68")!, identifier: "lobby")
        locationManager.startMonitoring(for: region1)
        region2 = CLBeaconRegion(proximityUUID: UUID(uuidString: "236C434A-4404-4D0B-A4E6-064BFD734959")!, identifier: "gym")
        locationManager.startMonitoring(for: region2)
        region3 = CLBeaconRegion(proximityUUID: UUID(uuidString: "BCA717D7-23C3-42BD-883A-22D4F44104CC")!, identifier: "pool")
        locationManager.startMonitoring(for: region3)
        
        let userDefault = UserDefaults.standard
        userDefault.set([], forKey: "currentLocations2")
        
        if !isAppAlreadyLaunchedOnce() {
            let userDefault = UserDefaults.standard
            userDefault.set([], forKey: "currentLocations2")
        }
        
        return true
}

}

extension AppDelegate: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("found ya")
        if region is CLBeaconRegion {
            let location = region.identifier
            let userDefault = UserDefaults.standard
            var curLocations = userDefault.value(forKey: "currentLocations2") as! [String]
            if !curLocations.contains(location) {
                curLocations.append(location)
                userDefault.set(curLocations, forKey: "currentLocations2")
                if let controller = cardsController {
                    print("reload")
                    controller.reloadData()
                }
                
            }
            
            print(curLocations)
            if let controller = presentationController {
                controller.reloadData()
            }
        }
    }
    
    
    func isAppAlreadyLaunchedOnce()->Bool{
        let defaults = UserDefaults.standard
        if let _ = defaults.string(forKey: "isAppAlreadyLaunchedOnce"){
            print("App already launched")
            return true
        }else{
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            return false
        }
    }

    }
    
    



