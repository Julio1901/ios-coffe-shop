//
//  ViewController.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 13/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var initialScreen = LoginScreen()
    private var homeViewModel : HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let coffeeRepository = CoffeeRepositoryImpl()
        homeViewModel = HomeViewModel(coffeeRepository: coffeeRepository)
        view = initialScreen
        fetchCoffeeList()
    }
        
    
    private func fetchCoffeeList() {
        homeViewModel.fetchCoffeeList()
    }
    
}

