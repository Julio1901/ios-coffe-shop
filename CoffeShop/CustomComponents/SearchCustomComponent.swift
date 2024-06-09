//
//  SearchCustomComponent.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 08/06/24.
//

import UIKit

class SearchCustomComponent: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        self.borderStyle = .none
        self.backgroundColor = UIColor(red: 42/255.0, green: 42/255.0, blue: 42/255.0, alpha: 1.0)
        self.layer.cornerRadius = 12
        self.translatesAutoresizingMaskIntoConstraints = false
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 24
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor:  UIColor(red: 162/255.0, green: 162/255.0, blue: 162/255.0, alpha: 1.0),
                .font: UIFont(name: "Sora-Regular", size: 12) as Any,
                .paragraphStyle: paragraphStyle
        ]
        
        let placeHolder = NSLocalizedString("search_coffee", comment: "")
        self.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: placeholderAttributes)
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Sora-Regular", size: 12) as Any,
            .paragraphStyle: paragraphStyle
        ]
        self.defaultTextAttributes = textAttributes
        
        let iconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        iconView.image = UIImage(systemName: "magnifyingglass")
        iconView.contentMode = .scaleToFill
        iconView.tintColor =  .white
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 16, y: 0, width: 20, height: 20))
        iconContainerView.addSubview(iconView)
        iconView.center = iconContainerView.center
        
        self.leftView = iconContainerView
        self.leftViewMode = .always
    }
}
