//
//  Extensions.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 14/05/24.
//

import UIKit

extension UILabel {
    public func setText (key: String) {
        self.text = NSLocalizedString(key, comment: "")
    }
}

extension UIButton {
    public func setText(key: String, for state: UIControl.State) {
        let text = NSLocalizedString(key, comment: "")
        self.setTitle(text, for: state)
    }
}
