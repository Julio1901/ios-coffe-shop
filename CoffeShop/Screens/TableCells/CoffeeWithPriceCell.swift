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
    
    var title: String? {
        didSet{
            titleLabel.text = title
        }
    }
    
    var coffeeType: String? {
        didSet{
            coffeeTypeLabel.text = coffeeType
        }
    }
    
    var price: String? {
        didSet{
            
            if let price {
                priceLabel.text = "$ \(price)"
            }else {
                priceLabel.font = priceLabel.font.withSize(8)
                priceLabel.setText(key: "price_not_found")
            }
        }
    }
    
//    var image: UIImage? {
//           didSet {
//               imageView.image = image
//               if image != nil {
//                   hideLoader()
//               }
//           }
//       }
    
    var imageView: UIImageView = {
        let it = UIImageView()
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
    
    private var titleLabel: UILabel = {
        let it = UILabel()
         it.translatesAutoresizingMaskIntoConstraints = false
         it.textColor = UIColor(.black)
         it.font = UIFont(name: "Sora-SemiBold", size: 16)
        return it
    }()
    
    private var coffeeTypeLabel: UILabel = {
        let it = UILabel()
         it.translatesAutoresizingMaskIntoConstraints = false
         it.textColor = UIColor(.black)
         it.font = UIFont(name: "Sora-Regular", size: 12)
        it.textColor = UIColor(red: 162/255.0, green: 162/255.0, blue: 162/255.0, alpha: 1.0)
        return it
    }()
    
    private var priceLabel: UILabel = {
        let it = UILabel()
         it.translatesAutoresizingMaskIntoConstraints = false
         it.textColor = UIColor(.black)
         it.font = UIFont(name: "Sora-SemiBold", size: 18)
        return it
    }()
    
    private lazy var addButton: UIButton = {
        let it = UIButton()
        it.widthAnchor.constraint(equalToConstant: 32).isActive = true
        it.heightAnchor.constraint(equalToConstant: 32).isActive = true
        it.backgroundColor = UIColor(red: 198/255.0, green: 124/255.0, blue: 78/255.0, alpha: 1.0)
        it.layer.cornerRadius = 8
        let image = UIImage(named: "plus-button-icon")
        it.setImage(image, for: .normal)
        it.translatesAutoresizingMaskIntoConstraints = false
        return it
    }()
    
    var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(imageView)
            addSubview(ratingLayer)
            addSubview(starIcon)
            addSubview(ratingNote)
            addSubview(titleLabel)
            addSubview(coffeeTypeLabel)
            addSubview(priceLabel)
            addSubview(addButton)
            addSubview(activityIndicator)
            setupConstraints()
            showLoader()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 140),
            imageView.heightAnchor.constraint(equalToConstant: 128),
            
            ratingLayer.topAnchor.constraint(equalTo: imageView.topAnchor),
            ratingLayer.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            ratingLayer.widthAnchor.constraint(equalToConstant: 51),
            ratingLayer.heightAnchor.constraint(equalToConstant: 28),
            
            starIcon.topAnchor.constraint(equalTo: ratingLayer.topAnchor, constant: 8),
            starIcon.leadingAnchor.constraint(equalTo: ratingLayer.leadingAnchor, constant: 8),
            starIcon.bottomAnchor.constraint(equalTo: ratingLayer.bottomAnchor, constant: -8),
            
            ratingNote.leadingAnchor.constraint(equalTo: starIcon.trailingAnchor, constant: 4),
            ratingNote.centerYAnchor.constraint(equalTo: starIcon.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            
            coffeeTypeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            coffeeTypeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
    
            priceLabel.topAnchor.constraint(equalTo: coffeeTypeLabel.bottomAnchor, constant: 10.5),
            priceLabel.leadingAnchor.constraint(equalTo: coffeeTypeLabel.leadingAnchor),
            
            addButton.topAnchor.constraint(equalTo: coffeeTypeLabel.bottomAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
    }
    
    func showLoader() {
        activityIndicator.startAnimating()
    }
    
    func hideLoader() {
        activityIndicator.stopAnimating()
    }

}
