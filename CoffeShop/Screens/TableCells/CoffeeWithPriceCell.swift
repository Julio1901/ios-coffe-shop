//
//  CoffeeWithPriceCell.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 24/05/24.
//

import UIKit

class CoffeeWithPriceCell: UITableViewCell {
    
    static let reuseIdentifier = "CoffeeWithPriceCell"
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.textLabel?.font = UIFont.systemFont(ofSize: 16)
            contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            contentView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
