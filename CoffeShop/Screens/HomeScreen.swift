//
//  HomeScreen.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 24/05/24.
//

import UIKit
import FLAnimatedImage

class HomeScreen : UIView {
    
    private let DEFAULT_LEADING_ANCHOR_VALUE : CGFloat = 24
    private let DEFAULT_TRAILING_ANCHOR_VALUE : CGFloat = -24
    
    private var topContainer: UIView = {
        let it = UIView()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1.0)
        return it
    }()
    
//    private var titleLabel: UILabel = {
//       let it = UILabel()
//        it.translatesAutoresizingMaskIntoConstraints = false
//        it.setText(key: "home_screen")
//        it.textColor = UIColor(.black)
//        it.font = UIFont(name: "Sora-SemiBold", size: 32)
//        it.numberOfLines = 0
//        it.textAlignment = .center
//        it.lineBreakMode = .byWordWrapping
//        return it
//    }()
    
    private var locationLabel: UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.font = UIFont(name: "Sora-Regular", size: 12)
        it.textColor = UIColor(red: 162/255.0, green: 162/255.0, blue: 162/255.0, alpha: 1.0)
        it.setText(key: "location")
        return it
    }()
    
    private var locationButton: UIButton = {
        let it  = UIButton()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.titleLabel?.font = UIFont(name: "Sora-SemiBold", size: 14)
        it.setTitle("Bilzn, Tanjungbalai", for: .normal)
        let arrowImage = UIImage(systemName: "chevron.down")
        it.setImage(arrowImage, for: .normal)
        it.semanticContentAttribute = .forceRightToLeft
        it.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
        it.tintColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0)
        it.showsMenuAsPrimaryAction = true
        return it
    }()
    
    var locationMenu: UIMenu = {
        let it  = UIMenu(
            title: "Location options", options: .displayInline, children: [
                UIAction(title: "Test 1",  handler: { (_) in
                    print("test 1 pressed")
                }),
                UIAction(title: "Test 2",  handler: { (_) in
                    print("test 2 pressed")
                }),
                UIAction(title: "Test 3",  handler: { (_) in
                    print("test 3 pressed")
                })
            ]
        )
        return it
    }()
    
    
    var listCategoryScrollView: UIScrollView = {
           let scrollView = UIScrollView()
           scrollView.translatesAutoresizingMaskIntoConstraints = false
           scrollView.showsHorizontalScrollIndicator = false
           return scrollView
       }()
    
    var listCategoryStackView: UIStackView = {
          let stackView = UIStackView()
          stackView.axis = .horizontal
          stackView.alignment = .fill
          stackView.spacing = 16
          stackView.translatesAutoresizingMaskIntoConstraints = false
          return stackView
      }()
    
    var coffeeList: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let it = UICollectionView(frame: .zero, collectionViewLayout: layout)
        it.backgroundColor = UIColor(.white)
        it.translatesAutoresizingMaskIntoConstraints = false
        return it
    }()
        
    var loadingImage: FLAnimatedImageView! = {
        let it = FLAnimatedImageView()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.heightAnchor.constraint(equalToConstant: 200).isActive = true
        it.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return it
    }()
    
    
    init(){
        super.init(frame: .zero)
        self.backgroundColor = UIColor(.white)
        addSubview(topContainer)
        addSubview(locationLabel)
        addSubview(locationButton)
        addSubview(coffeeList)
        addSubview(loadingImage)
        addSubview(listCategoryScrollView)
        listCategoryScrollView.addSubview(listCategoryStackView)
        setupConstraints()
        locationButton.menu = locationMenu
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            topContainer.topAnchor.constraint(equalTo: self.topAnchor),
            topContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topContainer.heightAnchor.constraint(equalToConstant: 280),
            
            locationLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 24),
            locationLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            
            locationButton.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
            locationButton.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor),
            
            listCategoryScrollView.leadingAnchor.constraint(equalTo: coffeeList.leadingAnchor),
            listCategoryScrollView.trailingAnchor.constraint(equalTo: coffeeList.trailingAnchor),
            listCategoryScrollView.topAnchor.constraint(equalTo: topContainer.bottomAnchor),
            listCategoryScrollView.heightAnchor.constraint(equalToConstant: 29),
            
            listCategoryStackView.leadingAnchor.constraint(equalTo: listCategoryScrollView.leadingAnchor),
                       listCategoryStackView.trailingAnchor.constraint(equalTo: listCategoryScrollView.trailingAnchor),
                       listCategoryStackView.topAnchor.constraint(equalTo: listCategoryScrollView.topAnchor),
                       listCategoryStackView.bottomAnchor.constraint(equalTo: listCategoryScrollView.bottomAnchor),
                       listCategoryStackView.heightAnchor.constraint(equalTo: listCategoryScrollView.heightAnchor),
            
            coffeeList.topAnchor.constraint(equalTo: listCategoryScrollView.bottomAnchor, constant: 16),
            coffeeList.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE),
            coffeeList.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: DEFAULT_TRAILING_ANCHOR_VALUE),
            coffeeList.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            loadingImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingImage.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
}
