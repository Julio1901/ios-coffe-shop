//
//  SelectableCustomButton.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 06/06/24.
//

import UIKit

class SelectableCustomButton: UIButton {

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
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
