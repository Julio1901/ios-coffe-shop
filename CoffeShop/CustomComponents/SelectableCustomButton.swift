//
//  SelectableCustomButton.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 06/06/24.
//

import UIKit

protocol SelectableCustomButtonDelegate {
    func buttonPressed (buttonTitle: String)
}

class SelectableCustomButton: UIButton {

    private var wasSelected = false
    var delegate : SelectableCustomButtonDelegate!
    
    private func setupButton() {
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.minimumScaleFactor = 0.5
        self.configuration = UIButton.Configuration.filled()
        self.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8)
        self.configuration?.baseBackgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 0.35)
        self.titleLabel?.font = UIFont(name: "Sora-Regular", size: 14)
        self.setTitleColor(.black, for: .normal)
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        self.isAccessibilityElement = true
        self.accessibilityTraits = .button
    }

    func setupSelectedState() {
        wasSelected = true
        self.titleLabel?.textColor = UIColor(.white)
        self.configuration?.baseBackgroundColor = UIColor(red: 198/255, green: 124/255, blue: 77/255, alpha: 1.0)
    }
    
    func setupDefaultState() {
        wasSelected = false
        self.configuration?.baseBackgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 0.35)
        self.titleLabel?.textColor = UIColor(.black)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        if wasSelected {
            setupDefaultState()
            delegate.buttonPressed(buttonTitle:"")
        }else {
            setupSelectedState()
            delegate.buttonPressed(buttonTitle: sender.titleLabel?.text ?? "")
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectableCustomButton {
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        self.accessibilityHint = "Double tap to select \(title ?? "")"
    }
    
}
