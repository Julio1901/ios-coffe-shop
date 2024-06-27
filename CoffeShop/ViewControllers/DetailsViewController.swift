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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view = initialScreen
    }
    
}
