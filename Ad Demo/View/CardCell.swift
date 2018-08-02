//
//  CardCell.swift
//  Ad Demo
//
//  Created by John Allen on 7/31/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
    
    var card: Card? {
        didSet {
            DispatchQueue.main.async {
                self.companyNameLabel.text = self.card?.companyName
                if let url = self.card?.companyLogoImageURL {
                    if let image = self.getImage(urlString: url) {
                        self.companyLogo.image = image
                    }
                }
                self.discountLabel.text = self.card?.discount
                self.descriptionLabel.text = self.card?.discountDescription
                self.expirationDateLabel.text = self.card?.expirationDate
                if let url = self.card?.qrCodeImageURL {
                    if let image = self.getImage(urlString: url) {
                        self.qrCode.image = image
                    }
                }
            }
        }
    }
    
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
    
    let discountLabel: UILabel = {
        let lb = UILabel()
        lb.text = "30% OFF"
        lb.textColor = UIColor.white
        lb.textAlignment = .left
        lb.font = UIFont(name: "AmericanTypewriter-Bold", size: 50) //UIFont(name: "MarerFelt-Wide", size: 30)
        return lb
    }()
    
    let descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.text = "any pasta entree"
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
    
    let qrCode: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "qrcode4")
        return iv
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        clipsToBounds = true
        selectionStyle = .none
        setupViews()
        
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
        cardContainer.addSubview(discountLabel)
        cardContainer.addSubview(descriptionLabel)
        cardContainer.addSubview(customerNameLabel)
        cardContainer.addSubview(expirationLabel)
        cardContainer.addSubview(expirationDateLabel)
        cardContainer.addSubview(qrCode)
        addConstraintsWithFormat(format: "V:|[v0(60)][v1(1)]-16-[v2(40)]-8-[v3(20)]-25-[v4(30)]-25-[v5(18)][v6(20)]-8-[v7]-8-|", views: topContainer, seperatorView, discountLabel, descriptionLabel, customerNameLabel ,expirationLabel, expirationDateLabel, qrCode)
        addConstraintsWithFormat(format: "H:|[v0]|", views: topContainer)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: seperatorView)
        seperatorView.backgroundColor = UIColor.white
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: discountLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: descriptionLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: customerNameLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: expirationLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: expirationDateLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: expirationDateLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: qrCode)
        
        
        topContainer.addSubview(companyLogo)
        topContainer.addSubview(companyNameLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-[v1]|", views: companyLogo, companyNameLabel)
        addConstraint(companyLogo.heightAnchor.constraint(equalTo: topContainer.heightAnchor, multiplier: 0.75))
        addConstraint(companyLogo.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor))
        addConstraint(companyLogo.widthAnchor.constraint(equalTo: companyLogo.heightAnchor, multiplier: 1))
        
        addConstraint(companyNameLabel.heightAnchor.constraint(equalTo: topContainer.heightAnchor, multiplier: 0.75))
        addConstraint(companyNameLabel.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor))
        
        addSubview(seperatorView)
        
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
