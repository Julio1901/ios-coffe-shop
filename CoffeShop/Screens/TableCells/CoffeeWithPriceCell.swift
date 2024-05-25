//
//  CoffeeWithPriceCell.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 24/05/24.
//

import UIKit

class CoffeeWithPriceCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CoffeeWithPriceCell"
    
    
    private var image: UIImageView = {
        let it = UIImageView()
        it.image = UIImage(named: "coffe-background-image")
        it.translatesAutoresizingMaskIntoConstraints = false
        it.heightAnchor.constraint(equalToConstant: 128).isActive = true
        it.widthAnchor.constraint(equalToConstant: 140).isActive = true
        return it
    }()
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            contentView.widthAnchor.constraint(equalToConstant: 100).isActive = true
            addSubview(image)
        self.backgroundColor = UIColor(.black)
            setupConstraints()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         
           
        ])
    }
}
