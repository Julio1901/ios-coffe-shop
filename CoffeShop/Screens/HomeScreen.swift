//
//  HomeScreen.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 24/05/24.
//

import UIKit

class HomeScreen : UIView {
    
    
    private let DEFAULT_LEADING_ANCHOR_VALUE : CGFloat = 24
    private let DEFAULT_TRAILING_ANCHOR_VALUE : CGFloat = -24
    
    
    private var titleLabel: UILabel = {
       let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.setText(key: "home_screen")
        it.textColor = UIColor(.black)
        it.font = UIFont(name: "Sora-SemiBold", size: 32)
        it.numberOfLines = 0
        it.textAlignment = .center
        it.lineBreakMode = .byWordWrapping
        return it
    }()
    
    var coffeeList: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let it = UICollectionView(frame: .zero, collectionViewLayout: layout)
        it.translatesAutoresizingMaskIntoConstraints = false
        return it
    }()
        
    
    init(){
        super.init(frame: .zero)
        self.backgroundColor = UIColor(.white)
        addSubview(titleLabel)
        addSubview(coffeeList)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: DEFAULT_TRAILING_ANCHOR_VALUE),
            
            
            coffeeList.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            coffeeList.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE),
            coffeeList.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: DEFAULT_TRAILING_ANCHOR_VALUE),
            coffeeList.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
            
        ])
    }
    
}
