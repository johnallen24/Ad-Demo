//
//  MuseumCard.swift
//  Ad Demo
//
//  Created by John Allen on 8/3/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit

class MuseumCardCell: UITableViewCell  {
    
//    var card: Card? {
//        didSet {
//            DispatchQueue.main.async {
//                self.companyNameLabel.text = self.card?.companyName
//                if let url = self.card?.companyLogoImageURL {
//                    if let image = self.getImage(urlString: url) {
//                        self.companyLogo.image = image
//                    }
//                }
//                self.discountLabel.text = self.card?.discount
//                self.descriptionLabel.text = self.card?.discountDescription
//                self.expirationDateLabel.text = self.card?.expirationDate
//                if let url = self.card?.qrCodeImageURL {
//                    if let image = self.getImage(urlString: url) {
//                        self.qrCode.image = image
//                    }
//                }
//            }
//        }
//    }
    
    func getImage(urlString: String) -> UIImage? {
        var image: UIImage?
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
                    return
                }
                
                image = UIImage(data: data!)
                }.resume()
            
        }
        return image
    }
    
    let companyLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let companyNameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Movies"
        lb.textColor = UIColor.white
        lb.textAlignment = .left
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 20) //UIFont(name: "MarerFelt-Wide", size: 30)
        return lb
    }()
    
    let topContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let cardContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    //allows for color of the card above to be shown around the rounded corners of  cardContainer
    let colorContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        return view
    }()
    
    let authorLabel: UILabel = {
        let lb = UILabel()
        lb.adjustsFontSizeToFitWidth = true
        lb.text = "30% OFF"
        lb.textColor = UIColor.white
        lb.textAlignment = .left
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 20) //UIFont(name: "MarerFelt-Wide", size: 30)
        return lb
    }()
    
    let descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.adjustsFontSizeToFitWidth = true
        lb.text = "any pasta entree"
        lb.numberOfLines = 0
        lb.textColor = UIColor.white
        lb.textAlignment = .left
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 20) //UIFont(name: "MarerFelt-Wide", size: 30)
        return lb
    }()
    
    let customerNameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "John Allen"
        lb.textColor = UIColor.white
        lb.textAlignment = .left
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 25) //UIFont(name: "MarerFelt-Wide", size: 30)
        return lb
    }()
    
    let expirationLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Expires"
        lb.textColor = UIColor.white
        lb.textAlignment = .left
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 14) //UIFont(name: "MarerFelt-Wide", size: 30)
        return lb
    }()
    
    let expirationDateLabel: UILabel = {
        let lb = UILabel()
        lb.text = "8/20/18"
        lb.textColor = UIColor.white
        lb.textAlignment = .left
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 18) //UIFont(name: "MarerFelt-Wide", size: 30)
        return lb
    }()
    
    let imageView2: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        //iv.image = UIImage(named: "qrcode4")
        return iv
    }()
    
    let coverTapView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        clipsToBounds = true
        selectionStyle = .none
        setupViews()
        
        let gt = UILongPressGestureRecognizer(target: self, action: #selector(didTap))
        //let gt = UITapGestureRecognizer(target: self, action: #selector(didTap))
       //gt.numberOfTapsRequired = 2
        gt.delegate = self
        coverTapView.addGestureRecognizer(gt)
        coverTapView.isUserInteractionEnabled = true
        
        
    }
    
    @objc func didTap(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            print("123")
        }
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//
//        }, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(colorContainer)
        addConstraintsWithFormat(format: "H:|-35-[v0]-35-|", views: colorContainer)
        addConstraintsWithFormat(format: "V:|[v0(60)]", views: colorContainer)
        addSubview(cardContainer)
        addConstraintsWithFormat(format: "H:|-35-[v0]-35-|", views: cardContainer)
        addConstraintsWithFormat(format: "V:|[v0(403)]", views: cardContainer)
        cardContainer.layer.cornerRadius = 15
        //        cardContainer.layer.borderWidth = 1
        //        cardContainer.layer.borderColor = UIColor.black.cgColor
        
        cardContainer.addSubview(topContainer)
        cardContainer.addSubview(seperatorView)
        cardContainer.addSubview(authorLabel)
        cardContainer.addSubview(descriptionLabel)
        //cardContainer.addSubview(customerNameLabel)
        //cardContainer.addSubview(expirationLabel)
        //cardContainer.addSubview(expirationDateLabel)
        cardContainer.addSubview(imageView2)
        addConstraintsWithFormat(format: "V:|[v0(60)][v1(1)]-16-[v2(20)]-16-[v3(75)]-16-[v4]-8-|", views: topContainer, seperatorView, authorLabel, descriptionLabel, imageView2)
        addConstraintsWithFormat(format: "H:|[v0]|", views: topContainer)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: seperatorView)
        seperatorView.backgroundColor = UIColor.white
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: authorLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: descriptionLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: imageView2)
       
        
        
        //topContainer.addSubview(companyLogo)
        topContainer.addSubview(companyNameLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views:companyNameLabel)
        //addConstraint(companyLogo.heightAnchor.constraint(equalTo: topContainer.heightAnchor, multiplier: 0.75))
       // addConstraint(companyLogo.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor))
        //addConstraint(companyLogo.widthAnchor.constraint(equalTo: companyLogo.heightAnchor, multiplier: 1))
        
        addConstraint(companyNameLabel.heightAnchor.constraint(equalTo: topContainer.heightAnchor, multiplier: 0.75))
        addConstraint(companyNameLabel.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor))
        
        addSubview(seperatorView)
        
        addSubview(coverTapView)
         addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: coverTapView)
         addConstraintsWithFormat(format: "V:|[v0]|", views: coverTapView)
        bringSubview(toFront: coverTapView)
        coverTapView.layer.zPosition = 1
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
