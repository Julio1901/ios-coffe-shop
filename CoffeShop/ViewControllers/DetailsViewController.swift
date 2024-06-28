//
//  DetailsViewController.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 27/06/24.
//

import Foundation
import UIKit

class DetailsViewController : UIViewController {
    
    private var initialScreen = DetailsScreen()
    var coffeeViewModel : CoffeeViewModel!
    var isFavorite = false

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        initialScreen.delegate = self
        view = initialScreen
    }
}

extension DetailsViewController : DetailsScreenDelegate {
    func favoriteButtonDidTapped() {
        initialScreen.setFavoriteIconState(isSelected: isFavorite)
        self.isFavorite = !isFavorite
    }
    
    
}
