//
//  LoginScreen.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 13/05/24.
//

import UIKit

protocol LoginScreenDelegate: AnyObject {
    func navigateToHome()
}

class LoginScreen: UIView {

    private let DEFAULT_LEADING_ANCHOR_VALUE : CGFloat = 24
    private let DEFAULT_TRAILING_ANCHOR_VALUE : CGFloat = -24
    
    weak var delegate: LoginScreenDelegate?
    
    private var backGroundImage: UIImageView = {
        let it = UIImageView()
        it.image = UIImage(named: "coffe-background-image")
        it.translatesAutoresizingMaskIntoConstraints = false
        it.isAccessibilityElement = true
        it.accessibilityLabel = "A background image with a full coffee cup and coffee beans below it, falling into the cup."
        it.accessibilityTraits = .image
        return it
    }()
    
    private var titleLabel: UILabel = {
       let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.setText(key: "welcome_screen_title")
        it.textColor = UIColor(.white)
        it.font = UIFont(name: "Sora-SemiBold", size: 32)
        it.numberOfLines = 0
        it.textAlignment = .center
        it.lineBreakMode = .byWordWrapping
        it.isAccessibilityElement = true
        it.accessibilityHint = "Decorative message: no associated action."
        return it
    }()
    
    private var subTitleLabel : UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.setText(key: "welcome_screen_subtitle")
        it.font = UIFont(name: "Sora-Regular", size: 14)
        it.textColor = UIColor(red: 162/255.0, green: 162/255.0, blue: 162/255.0, alpha: 1.0)
        it.numberOfLines = 0
        it.textAlignment = .center
        it.lineBreakMode = .byWordWrapping
        it.isAccessibilityElement = true
        it.accessibilityHint = "Decorative message: no associated action."
        return it
    }()
    
    
    private lazy var getStartedButton: UIButton = {
        let it = UIButton()
        it.setText(key: "welcome_screen_button_message", for: .normal)
        it.titleLabel?.font = UIFont(name: "Sora-SemiBold", size: 18)
        it.heightAnchor.constraint(equalToConstant: 56).isActive = true
        it.backgroundColor = UIColor(red: 198/255.0, green: 124/255.0, blue: 78/255.0, alpha: 1.0)
        it.setTitleColor(UIColor.white, for: .normal)
        it.layer.cornerRadius = 16
        it.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        it.addTarget(self, action: #selector(buttonReleased(_:)), for: .touchUpInside)
        it.translatesAutoresizingMaskIntoConstraints = false
        it.isAccessibilityElement = true
        it.accessibilityHint = "Double tap to go to the Home screen."
        return it
    }()
    
    init(){
        super.init(frame: .zero)
        addSubview(backGroundImage)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(getStartedButton)
        setupConstraints()
        self.backgroundColor = UIColor(.black)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor(red: 178/255.0, green: 104/255.0, blue: 58/255.0, alpha: 1.0)
        delegate?.navigateToHome()
    }
    
    @objc private func buttonReleased(_ sender: UIButton) {
        sender.backgroundColor = UIColor(red: 198/255.0, green: 124/255.0, blue: 78/255.0, alpha: 1.0)
    }
    
    private func setupConstraints() {
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            backGroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backGroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backGroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
           
        ])
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: subTitleLabel.topAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: DEFAULT_TRAILING_ANCHOR_VALUE),
        ])
        NSLayoutConstraint.activate([
            subTitleLabel.bottomAnchor.constraint(equalTo: getStartedButton.topAnchor, constant: -32),
            subTitleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE),
            subTitleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: DEFAULT_TRAILING_ANCHOR_VALUE),
        ])
        NSLayoutConstraint.activate([
            getStartedButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
            getStartedButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE),
            getStartedButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: DEFAULT_TRAILING_ANCHOR_VALUE),
        ])
    }
    
}
