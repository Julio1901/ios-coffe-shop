//
//  ViewController.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 13/05/24.
//

import UIKit

class ViewController: UIViewController, LoginScreenDelegate {

    
    private var initialScreen = LoginScreen()
//    private var homeViewModel : HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialScreen.delegate = self
        view = initialScreen
    }
        
    func navigateToHome() {
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }

}

