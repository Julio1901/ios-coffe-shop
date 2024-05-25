//
//  CoffeeWithPriceCell.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 24/05/24.
//

import UIKit

class CoffeeWithPriceCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CoffeeWithPriceCell"
    
    private let DEFAULT_LEADING_ANCHOR_VALUE : CGFloat = 8
    private let DEFAULT_TRAILING_ANCHOR_VALUE : CGFloat = -8
    
    var rating: String? {
        didSet {
            ratingNote.text = rating
        }
    }
    
    private var image: UIImageView = {
        let it = UIImageView()
        it.image = UIImage(named: "coffe-product-image")
        it.contentMode = .scaleToFill
        it.layer.cornerRadius = 12
        it.layer.masksToBounds = true
        it.translatesAutoresizingMaskIntoConstraints = false
        return it
    }()
    
    private var ratingLayer: UIView = {
        let it = UIView()
        it.backgroundColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.30)
        it.layer.cornerRadius = 12
        it.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
        it.translatesAutoresizingMaskIntoConstraints = false
        return it
    }()
    
    private var starIcon: UIImageView = {
        let it = UIImageView()
        it.image = UIImage(named: "star-icon")
        it.contentMode = .scaleToFill
        it.translatesAutoresizingMaskIntoConstraints = false
        return it
    }()
    
    private var ratingNote: UILabel = {
        let it = UILabel()
         it.translatesAutoresizingMaskIntoConstraints = false
         it.textColor = UIColor(.white)
         it.font = UIFont(name: "Sora-SemiBold", size: 8)
        return it
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = UIColor(.blue)
            addSubview(image)
            addSubview(ratingLayer)
            addSubview(starIcon)
            addSubview(ratingNote)
            setupConstraints()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 140),
            image.heightAnchor.constraint(equalToConstant: 128),
            
            ratingLayer.topAnchor.constraint(equalTo: image.topAnchor),
            ratingLayer.trailingAnchor.constraint(equalTo: image.trailingAnchor),
            ratingLayer.widthAnchor.constraint(equalToConstant: 51),
            ratingLayer.heightAnchor.constraint(equalToConstant: 28),
            
            starIcon.topAnchor.constraint(equalTo: ratingLayer.topAnchor, constant: 8),
            starIcon.leadingAnchor.constraint(equalTo: ratingLayer.leadingAnchor, constant: 8),
            starIcon.bottomAnchor.constraint(equalTo: ratingLayer.bottomAnchor, constant: -8),
            
            ratingNote.leadingAnchor.constraint(equalTo: starIcon.trailingAnchor, constant: 4),
            ratingNote.centerYAnchor.constraint(equalTo: starIcon.centerYAnchor )
    
        ])
    }
    

}
