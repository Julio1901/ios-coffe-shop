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
        
    private var locationLabel: UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.font = UIFont(name: "Sora-Regular", size: 12)
        it.textColor = UIColor(red: 162/255.0, green: 162/255.0, blue: 162/255.0, alpha: 1.0)
        it.setText(key: "location")
        it.isAccessibilityElement = true
        it.accessibilityLabel = "Location"
        it.accessibilityHint = "Location button title. This have no associated action."
        return it
    }()
    
    var locationButton: UIButton = {
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
        it.isAccessibilityElement = true
        it.accessibilityLabel = "Bilzn, Tanjungbalai"
        it.accessibilityHint = "Double tap to select location."
        return it
    }()
        
    var searchComponent : SearchCustomComponent = {
        let it = SearchCustomComponent()
        it.setupDisableState()
        return it
    }()
    
    var coffeeBanner : UIImageView = {
        let it = UIImageView()
        it.image = UIImage(named: "coffee-banner")
        it.translatesAutoresizingMaskIntoConstraints = false
        it.layer.cornerRadius = 12
        it.layer.masksToBounds = true
        it.isAccessibilityElement = true
        it.accessibilityTraits = .image
        it.accessibilityHint = "Decorative image: no associated action."
        it.tag = 123
        return it
    }()
    
    var bannerPromoTag : UIView = {
        let it = UIView()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.layer.cornerRadius = 8
        it.layer.masksToBounds = true
        it.backgroundColor = UIColor(red: 237/255, green: 81/255, blue: 81/255, alpha: 1.0)
        it.isAccessibilityElement = false
        return it
    }()
    
    var bannerPromoTagLabel : UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.text = NSLocalizedString("banner_promo", comment: "")
        it.font = UIFont(name: "Sora-SemiBold", size: 14)
        it.textColor = .white
        it.isAccessibilityElement = false
        return it
    } ()
    
    var firstLinePromoBannerBackLayer : UIView = {
        let it = UIView()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1.0)
        it.isAccessibilityElement = false
        return it
    }()
    
    var secondLinePromoBannerBackLayer : UIView = {
        let it = UIView()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1.0)
        it.isAccessibilityElement = false
        return it
    }()
    
    var firstLinePromoLabel : UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.font = UIFont(name: "Sora-SemiBold", size: 32)
        it.textColor = .white
        it.text = NSLocalizedString("banner_first_line_label_text", comment: "")
        it.isAccessibilityElement = false
        return it
    }()
    
    var secondLinePromoLabel : UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.font = UIFont(name: "Sora-SemiBold", size: 32)
        it.textColor = .white
        it.text = NSLocalizedString("banner_second_line_label_text", comment: "")
        it.isAccessibilityElement = false
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
        it.isAccessibilityElement = true
        it.accessibilityLabel = "Animated image of coffee moving horizontally indicating the coffee list is loading."
        it.accessibilityHint = "Decorative image: no associated action."
        return it
    }()
    
    init(){
        super.init(frame: .zero)
        self.backgroundColor = UIColor(.white)
        setupSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setupAggroupedAccessibilityElements(){
        coffeeBanner.accessibilityLabel = "\(bannerPromoTagLabel.text ?? "") \(firstLinePromoLabel.text ?? "") \(secondLinePromoLabel.text ?? "")"
    }
    
    func setupLoadingImage(animatedImage: FLAnimatedImage?) {
        loadingImage.animatedImage = animatedImage
        loadingImage.isAccessibilityElement = true
        loadingImage.accessibilityLabel = "Animated image of coffee moving horizontally indicating the coffee list is loading."
        loadingImage.accessibilityHint = "Decorative image: no associated action."
    }
    
    private func setupSubViews() {
        addSubview(topContainer)
        addSubview(locationLabel)
        addSubview(locationButton)
        addSubview(coffeeList)
        addSubview(loadingImage)
        addSubview(listCategoryScrollView)
        listCategoryScrollView.addSubview(listCategoryStackView)
        addSubview(searchComponent)
        addSubview(coffeeBanner)
        bannerPromoTag.addSubview(bannerPromoTagLabel)
        addSubview(bannerPromoTag)
        addSubview(firstLinePromoBannerBackLayer)
        addSubview(secondLinePromoBannerBackLayer)
        addSubview(firstLinePromoLabel)
        addSubview(secondLinePromoLabel)
    }
        
    private func setupAccessibilityItemAtViewHierarchIndex(_ index: Int, component: Any) {
        
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
            
            searchComponent.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 24),
            searchComponent.leadingAnchor.constraint(equalTo: locationButton.leadingAnchor),
            searchComponent.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -92),
            searchComponent.heightAnchor.constraint(equalToConstant: 52),
            
            coffeeBanner.heightAnchor.constraint(equalToConstant: 140),
            coffeeBanner.widthAnchor.constraint(equalToConstant: 327),
            coffeeBanner.topAnchor.constraint(equalTo: searchComponent.bottomAnchor, constant: 24),
            coffeeBanner.leadingAnchor.constraint(equalTo: searchComponent.leadingAnchor),
            coffeeBanner.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -28),
            
            bannerPromoTag.widthAnchor.constraint(equalToConstant: 60),
            bannerPromoTag.heightAnchor.constraint(equalToConstant: 26),
            bannerPromoTag.topAnchor.constraint(equalTo: coffeeBanner.topAnchor, constant: 13),
            bannerPromoTag.leadingAnchor.constraint(equalTo: coffeeBanner.leadingAnchor, constant: 24),
            
            bannerPromoTagLabel.centerXAnchor.constraint(equalTo: bannerPromoTag.centerXAnchor),
            bannerPromoTagLabel.centerYAnchor.constraint(equalTo: bannerPromoTag.centerYAnchor),
            
            firstLinePromoBannerBackLayer.widthAnchor.constraint(equalToConstant: 200),
            firstLinePromoBannerBackLayer.heightAnchor.constraint(equalToConstant: 27),
            firstLinePromoBannerBackLayer.topAnchor.constraint(equalTo: bannerPromoTag.bottomAnchor, constant: 23),
            firstLinePromoBannerBackLayer.leadingAnchor.constraint(equalTo: bannerPromoTag.leadingAnchor),
        
            secondLinePromoBannerBackLayer.widthAnchor.constraint(equalToConstant: 149),
            secondLinePromoBannerBackLayer.heightAnchor.constraint(equalToConstant: 23),
            secondLinePromoBannerBackLayer.topAnchor.constraint(equalTo: firstLinePromoBannerBackLayer.bottomAnchor, constant: 12),
            secondLinePromoBannerBackLayer.leadingAnchor.constraint(equalTo: firstLinePromoBannerBackLayer.leadingAnchor),
            
            firstLinePromoLabel.topAnchor.constraint(equalTo: firstLinePromoBannerBackLayer.topAnchor, constant: -15),
            firstLinePromoLabel.leadingAnchor.constraint(equalTo: firstLinePromoBannerBackLayer.leadingAnchor, constant: 1),
            
            secondLinePromoLabel.topAnchor.constraint(equalTo: secondLinePromoBannerBackLayer.topAnchor, constant: -15),
            secondLinePromoLabel.leadingAnchor.constraint(equalTo: secondLinePromoBannerBackLayer.leadingAnchor, constant: 1),
            
            listCategoryScrollView.leadingAnchor.constraint(equalTo: coffeeList.leadingAnchor),
            listCategoryScrollView.trailingAnchor.constraint(equalTo: coffeeList.trailingAnchor),
            listCategoryScrollView.topAnchor.constraint(equalTo: coffeeBanner.bottomAnchor, constant: 24),
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
            loadingImage.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: (topContainer.frame.height + (280 / 2) - 50))
        ])
    }
}
