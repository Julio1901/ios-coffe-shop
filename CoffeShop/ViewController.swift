//
//  ViewController.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 13/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var initialScreen = LoginScreen()
    private var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = initialScreen
        
        fetchCoffeeList()
    }


    private func fetchCoffeeList() {
            Task {
                do {
                    let coffees = try await homeViewModel.getCoffeeList()
                    DispatchQueue.main.async {
                        print("Test **********************************")
                        print(coffees)
                    }
                } catch {
                    print("Erro ao buscar a lista de cafés: \(error)")
                }
            }
        }
    
}

