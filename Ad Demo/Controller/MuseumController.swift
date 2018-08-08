//
//  MuseumController.swift
//  Ad Demo
//
//  Created by John Allen on 8/3/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit

class MuseumController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var category: Category?
    
    var isSignedIn = false
    var selectedIndexPath = -1
    var isTableCellSelected = false
    
    let cards: UITableView = {
        let tb = UITableView()
        return tb
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //appDelegate.cardsController = self
        
        checkData()
        
        
        getData()
        view.backgroundColor = UIColor.white
        cards.delegate = self
        cards.dataSource = self
        cards.register(MuseumCardCell.self, forCellReuseIdentifier: "cellID")
        cards.tableFooterView = UIView()
        cards.separatorStyle = .none
        
        setupViews()
        
    }
    
    var images: [UIImage]?
    
    func getData() {
        let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/ad-demo-b7c12.appspot.com/o/qrcode4.png?alt=media&token=79c6da39-2e74-49aa-b607-3f100fc19aa5")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            self.images?.append(UIImage(data: data!)!)
            
            }.resume()
    }
    
    func setupViews() {
        if let category = self.category {
            switch category {
            case .movie:
                navigationItem.title = "Movies"
            case .food:
                navigationItem.title = "Food"
            case .drink:
                navigationItem.title = "Drinks"
            case .event:
                navigationItem.title = "Events"
            }
        }
        
        view.addSubview(cards)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: cards)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: cards)
        
    }
    
    //change here
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if ((indexPath.row == (paintings.count - 1)) || (indexPath.row == selectedIndexPath)) {
            return 401
        } else if (isTableCellSelected) {
            return 10
        } else {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndexPath == indexPath.row {
            selectedIndexPath = -1
            isTableCellSelected = false
        } else {
            selectedIndexPath = indexPath.row
            isTableCellSelected = true
        }
        
        DispatchQueue.main.async {
            tableView.beginUpdates()
            //MARK: need to work on
            //            let row = indexPath.row + 1
            //            if row < self.cards.numberOfRows(inSection: 0) {
            //                let section = indexPath.section
            //                let indexPath = IndexPath(row: row, section: section)
            //                let cardBelow = self.cards.cellForRow(at: indexPath) as! CardCell
            //                cardBelow.colorContainer.backgroundColor = UIColor.clear
            //            }
            tableView.endUpdates()
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paintings.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    var locations: [String] = [] {
        didSet {
            for location in locations {
                if let logos = logosDict[location]  {
                    for logo in logos {
                        if !currentLogos.contains(logo) {
                            currentLogos.append(logo)
                        }
                    }
                }
                if let names = namesDict[location] {
                    for name in names {
                        if !currentNames.contains(name) {
                            currentNames.append(name)
                        }
                    }
                }
            }
        }
    }
    
    var currentLogos: [String] = []
    var currentNames: [String] = []
    
    
    let logos = ["redlobster-logo", "pfchangs-logo", "mcdonalds-logo3", "mikespastry-logo", "qdoba-logo", "olivegarden-logo"]
    
    let names = ["Red Lobster", "P.F. Chang's", "McDonalds", "Mike's Pastries", "Qdoba", "Olive Garden"]
    
    let logosDict = ["lobby": ["redlobster-logo", "pfchangs-logo"], "gym": ["mcdonalds-logo3", "mikespastry-logo"], "pool": ["qdoba-logo", "olivegarden-logo"]]
    
    let namesDict = ["lobby": ["Red Lobster", "P.F. Chang's"], "gym": ["McDonalds", "Mike's Pastries"], "pool": ["Qdoba", "Olive Garden"]]
    
    let discounts = ["$10 Off Any Fish","20% off","2 Big Macs for $5","Any Pastry Free","Get Free Chips","30% off"]
    
    let desciptions = ["with the puchase of a chowder", "any chicken dish","","with the purchase of 2 eclairs","with the purchase of any burrito","any pasta entree"]
    
    let colors: [UIColor] = [UIColor.colorWithHexString("00A86B"), UIColor.colorWithHexString("fd9d32"), UIColor.colorWithHexString("#189ad3"), UIColor.colorWithHexString("fb594a"), UIColor.colorWithHexString("000032"), UIColor.colorWithHexString("7694a5")]
    
    var previousColor: UIColor?
    
    func reloadData() {
        self.cards.beginUpdates()
        let userDefault = UserDefaults.standard
        locations = userDefault.value(forKey: "currentLocations2") as! [String]
        print(currentNames)
        print(currentLogos)
        let index = cards.numberOfRows(inSection: 0)
        DispatchQueue.main.async {
            let path1 = IndexPath(row: index-1, section: 0)
            let path2 = IndexPath(row: index, section: 0)
            self.cards.insertRows(at: [path1, path2], with: .automatic)
            self.cards.endUpdates()
            self.cards.reloadData()
        }
        
    }
    
    func checkData() {
        let userDefault = UserDefaults.standard
        locations = userDefault.value(forKey: "currentLocations2") as! [String]
    }
    
    let pnames = ["Mona Lisa", "Au Lapin Agile", "Freedom From Want"]
    let paintings = ["monalisa", "picasso", "normanrockwell"]
    let authors = ["Leonardo Da Vinci", "Picasso", "Norman Rockwell"]
    let descriptions = ["The title of the painting, which is known in English as Mona Lisa, comes from a description by Renaissance art historian Giorgio Vasari...", "Regarded as one of the most influential artists of the 20th century, he is known for co-founding the Cubist movement, the invention of constructed sculpture...", "The third of the Four Freedoms series of four oil paintings by American artist Norman Rockwell. The works were inspired by United States President Franklin D. Roosevelt's..."]
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = cards.dequeueReusableCell(withIdentifier: "cellID") as! MuseumCardCell
        
        //change back to currentnames and currentlogos
        cell.companyNameLabel.text = pnames[indexPath.row]
        cell.authorLabel.text = authors[indexPath.row]
        cell.descriptionLabel.text = descriptions[indexPath.row]
        cell.imageView2.image = UIImage(named: paintings[indexPath.row])
       
//        cell.discountLabel.text = discounts[indexPath.row]
//        cell.descriptionLabel.text = desciptions[indexPath.row]
        
        if isTableCellSelected == false {
            if let color = previousColor {
                cell.colorContainer.backgroundColor = color
            }
            previousColor = colors[indexPath.row]
        }
        else {
            print("123")
            cell.colorContainer.backgroundColor = UIColor.clear
        }
        
        cell.cardContainer.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    
}

