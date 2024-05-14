//
//  LoginScreen.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 13/05/24.
//

import UIKit

class LoginScreen: UIView {

    private let DEFAULT_LEADING_ANCHOR_VALUE : CGFloat = 36
    private let DEFAULT_TRAILING_ANCHOR_VALUE : CGFloat = -36
    
    private var titleLabel: UILabel = {
       let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.text = "Fall in Love with Coffee in Blissful Delight!"
        it.font = UIFont(name: "Sora-SemiBold", size: 32)
        it.numberOfLines = 0
        it.lineBreakMode = .byWordWrapping
        return it
    }()
    
    private var subTitleLabel : UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.text = "Welcome to our cozy coffee corner, where every cup is a delightful for you."
        it.font = UIFont(name: "Sora-Regular", size: 14)
        it.textColor = UIColor(red: 162/255.0, green: 162/255.0, blue: 162/255.0, alpha: 1.0)
        it.numberOfLines = 0
        it.lineBreakMode = .byWordWrapping
        return it
    }()
    
    private var getStartedButton: UIButton = {
        let it = UIButton()
        it.setTitle("Get Started", for: .normal)
        it.heightAnchor.constraint(equalToConstant: 56).isActive = true
        it.backgroundColor = UIColor(red: 198/255.0, green: 124/255.0, blue: 78/255.0, alpha: 1.0)
        it.setTitleColor(UIColor.white, for: .normal)
        it.titleLabel?.font = UIFont(name: "Sora-SemiBold", size: 18)
        it.layer.cornerRadius = 16
        it.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        it.addTarget(self, action: #selector(buttonReleased(_:)), for: .touchUpInside)
        it.translatesAutoresizingMaskIntoConstraints = false
        return it
    }()
    
    
    @objc private func buttonPressed(_ sender: UIButton) {
        // Altera a aparência do botão quando pressionado
        sender.backgroundColor = UIColor.black
    }
    
    
    @objc private func buttonReleased(_ sender: UIButton) {
        // Altera a aparência do botão quando pressionado
        sender.backgroundColor = UIColor(red: 198/255.0, green: 124/255.0, blue: 78/255.0, alpha: 1.0)
    }
    
    init(){
        super.init(frame: .zero)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(getStartedButton)
        setupConstraints()
        self.backgroundColor = UIColor(.white)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
    
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: DEFAULT_TRAILING_ANCHOR_VALUE),
        ])
        
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            getStartedButton.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 8),
            getStartedButton.leadingAnchor.constraint(equalTo: subTitleLabel.leadingAnchor, constant: 0),
            getStartedButton.trailingAnchor.constraint(equalTo: subTitleLabel.trailingAnchor, constant: 0),
           
        ])



    }
    
}
