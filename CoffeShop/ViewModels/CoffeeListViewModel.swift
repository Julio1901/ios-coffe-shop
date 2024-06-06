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
    var coffeesType: [String] = []
    
    var delegate : CoffeeListViewModelDelegate!
    
    
    
    init(coffeeRepository: CoffeeRepository) {
        self.coffeeRepository = coffeeRepository
        self.coffeesViewModel = [CoffeeViewModel]()
    }
    
    func loadData() {
        fetchCoffeeList()
    }

    private func fetchCoffeeList() {
        Task{
            do {
                let coffees = try await coffeeRepository.getCoffeeList()
                coffeesViewModel = coffees.map(CoffeeViewModel.init)
                getCoffessType()
                delegate.updateCoffeeList()
            } catch {
                print("Error fetch coffee list \(error.localizedDescription)")
            }
        }
    }
    
    private func getCoffessType() {
        coffeesViewModel.forEach { vm in
            
            for grindOption in vm.grindOption {
                if !coffeesType.contains(grindOption.description) {
                    coffeesType.append(grindOption.description)
                }
            }
            
        }
    }
    
}
