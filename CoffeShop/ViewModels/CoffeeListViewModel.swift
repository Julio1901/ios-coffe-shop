//
//  CoffeeListViewModel.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 30/05/24.
//

import Foundation

protocol CoffeeListViewModelDelegate {
    func updateCoffeeList()
}

class CoffeeListViewModel {
    
    private let coffeeRepository: CoffeeRepository
    var coffeesViewModel: [CoffeeViewModel]
    var delegate : CoffeeListViewModelDelegate!
    
    init(coffeeRepository: CoffeeRepository) {
        self.coffeeRepository = coffeeRepository
        self.coffeesViewModel = [CoffeeViewModel]()
        fetchCoffeeList()
    }

    func fetchCoffeeList() {
        Task{
            do {
                let coffees = try await coffeeRepository.getCoffeeList()
                coffeesViewModel = coffees.map(CoffeeViewModel.init)
                print(coffeesViewModel[2].name)
                delegate.updateCoffeeList()
            } catch {
                print("Error fetch coffee list \(error.localizedDescription)")
            }
        }
    }
    
}
