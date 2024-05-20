//
//  HomeViewModel.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 19/05/24.
//

import Foundation

class HomeViewModel {
        
    private let coffeeRepository: CoffeeRepository
    var coffeeList: [Coffee] = []
    
    init(coffeeRepository: CoffeeRepository) {
        self.coffeeRepository = coffeeRepository
    }

    func fetchCoffeeList() {
        Task{
            do {
                let coffees = try await coffeeRepository.getCoffeeList()
                coffeeList = coffees
            } catch {
                print("Error fetch coffee list \(error.localizedDescription)")
            }
        }
    }
    
}
