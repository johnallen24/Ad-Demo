//
//  Firebase URLGetter.swift
//  Ad Demo
//
//  Created by John Allen on 8/1/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit
import Firebase

class Firebase_URLGetter: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileManager = FileManager.default
        let enumerator = fileManager.enumerator(atPath: "/Users/johnallen/Downloads/uuids/4A3195B0-5D24-4C0B-A697-A02FA330CD54/food/logos")
        if let enumerator = enumerator {
            while let element = enumerator.nextObject() as? String {
                if let localFile = URL(string: "file:///Users/johnallen/Downloads/uuids/4A3195B0-5D24-4C0B-A697-A02FA330CD54/food/logos/\(element)") {
                    print("123")
                    let ref = Storage.storage().reference(withPath: "uuids/4A3195B0-5D24-4C0B-A697-A02FA330CD54/food/logos/\(element)")
                    
                    ref.putFile(from: localFile, metadata: nil) { metadata, error in
                        if error != nil {
                            print(error)
                            return
                        }
                        
                        ref.downloadURL { (url, error) in
                            guard let downloadURL = url else {
                                // Uh-oh, an error occurred!
                                return
                            }
                            
                            if let range = element.range(of:"-ex") {
                                let startIndex = range.upperBound
                                let number = element[startIndex]
                               // let dref = Database.database().reference(withPath: <#T##String#>)
                            }
                            else {
                                print("cannot find number in the string")
                            }
                        }
                    }
                }
            }
        }
    }
    
}
