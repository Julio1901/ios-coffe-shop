//
//  DetailsScreen.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 27/06/24.
//

import UIKit

class DetailsScreen: UIView {

    private let DEFAULT_LEADING_ANCHOR_VALUE : CGFloat = 24
    private let DEFAULT_TRAILING_ANCHOR_VALUE : CGFloat = -24
    
    private var titleLabel: UILabel = {
       let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.setText(key: "details_screen_title")
        it.textColor = UIColor(.white)
        it.font = UIFont(name: "Sora-SemiBold", size: 32)
        it.numberOfLines = 0
        it.textAlignment = .center
        it.lineBreakMode = .byWordWrapping
//        it.isAccessibilityElement = true
//        it.accessibilityHint = "Decorative message: no associated action."
        return it
    }()
    

    
    init(){
        super.init(frame: .zero)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews(){
        self.addSubview(titleLabel)
       
    }

    private func setupConstraints() {
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 280),
        ])
    }
    
}
