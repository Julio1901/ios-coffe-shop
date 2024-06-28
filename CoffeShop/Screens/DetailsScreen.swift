//
//  DetailsScreen.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 27/06/24.
//

import UIKit


protocol DetailsScreenDelegate {
    func favoriteButtonDidTapped()
}

class DetailsScreen: UIView {

    private let DEFAULT_LEADING_ANCHOR_VALUE : CGFloat = 24
    private let DEFAULT_TRAILING_ANCHOR_VALUE : CGFloat = -24
    
    var delegate : DetailsScreenDelegate!
    
    private var backButton : UIButton = {
        let it = UIButton(type: .system)
        if let icon = UIImage(systemName: "chevron.left") {
            it.setImage(icon, for: .normal)
            it.tintColor = UIColor(red: 42/255.0, green: 42/255.0, blue: 42/255.0, alpha: 1.0)
        }
        it.translatesAutoresizingMaskIntoConstraints = false
        return it
    }()
    
    private var titleLabel: UILabel = {
       let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.setText(key: "details_screen_title")
        it.textColor = UIColor(.black)
        it.font = UIFont(name: "Sora-SemiBold", size: 16)
        it.numberOfLines = 0
        it.textAlignment = .center
        it.lineBreakMode = .byWordWrapping
//        it.isAccessibilityElement = true
//        it.accessibilityHint = "Decorative message: no associated action."
        return it
    }()
    
    private var favoriteIcon: UIImageView = {
        let it = UIImageView()
        it.image = UIImage(named: "favorite-icon-not-filled")
        it.contentMode = .scaleToFill
        it.translatesAutoresizingMaskIntoConstraints = false
        it.isUserInteractionEnabled = true
        return it
    }()
    
    private var productImage: UIImageView = {
        let it = UIImageView()
        it.image = UIImage(named: "coffe-product-image")
        it.translatesAutoresizingMaskIntoConstraints = false
        it.contentMode = .scaleToFill
//        it.isAccessibilityElement = true
//        it.accessibilityLabel = "A background image with a full coffee cup and coffee beans below it, falling into the cup."
//        it.accessibilityTraits = .image
        return it
    }()
    

    private var productNameLabel: UILabel = {
       let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.text = "Coffee Mocha"
        it.textColor = UIColor(.black)
        it.font = UIFont(name: "Sora-SemiBold", size: 20)
        it.numberOfLines = 0
        it.textAlignment = .center
        it.lineBreakMode = .byWordWrapping
//        it.isAccessibilityElement = true
//        it.accessibilityHint = "Decorative message: no associated action."
        return it
    }()
    
    private var temperatureOptionsLabel: UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.font = UIFont(name: "Sora-Regular", size: 12)
        it.textColor = UIColor(red: 162/255.0, green: 162/255.0, blue: 162/255.0, alpha: 1.0)
        it.setText(key: "temperature_options")
//        it.isAccessibilityElement = true
//        it.accessibilityLabel = "Location"
//        it.accessibilityHint = "Location button title. This have no associated action."
        return it
    }()
    
    
    
    init(){
        super.init(frame: .zero)
        self.backgroundColor = UIColor(.white)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews(){
        self.addSubview(backButton)
        self.addSubview(titleLabel)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(favoriteButtonDidTapped))
        favoriteIcon.addGestureRecognizer(tapGesture)
        self.addSubview(favoriteIcon)
        self.addSubview(productImage)
        self.addSubview(productNameLabel)
        self.addSubview(temperatureOptionsLabel)
    }
    
    func setFavoriteIconState(isSelected: Bool) {
        if(isSelected){
            favoriteIcon.image =  UIImage(named: "favorite-icon-filled")
        } else {
            favoriteIcon.image =  UIImage(named: "favorite-icon-not-filled")
        }
    }
    
    @objc private func favoriteButtonDidTapped() {
        delegate.favoriteButtonDidTapped()
    }

    private func setupConstraints() {
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 36.5),
            backButton.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 34),
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 36.5),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            favoriteIcon.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            favoriteIcon.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: DEFAULT_TRAILING_ANCHOR_VALUE),
            productImage.heightAnchor.constraint(equalToConstant: 202),
            productImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 36.5),
            productImage.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE),
            productImage.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: DEFAULT_TRAILING_ANCHOR_VALUE),
            productNameLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 16),
            productNameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE),
            temperatureOptionsLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 4),
            temperatureOptionsLabel.leadingAnchor.constraint(equalTo: productNameLabel.leadingAnchor),

            
        ])
    }
    
}
