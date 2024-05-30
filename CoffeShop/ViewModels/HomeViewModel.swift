//
//  HomeViewModel.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 19/05/24.
//

import Foundation

protocol HomeViewModelDelegate {
    func updateCoffeeList()
}


class HomeViewModel : CoffeeListViewModelDelegate {
    
    func updateCoffeeList() {
        delegate.updateCoffeeList()
    }
            
    var coffeeListViewModel: CoffeeListViewModel
    var delegate : HomeViewModelDelegate!
    
    //TODO: make this with dependency injection
    init(coffeRepository: CoffeeRepository) {
        self.coffeeListViewModel = CoffeeListViewModel(coffeeRepository: coffeRepository)
        coffeeListViewModel.delegate = self
    }
    
    


}
