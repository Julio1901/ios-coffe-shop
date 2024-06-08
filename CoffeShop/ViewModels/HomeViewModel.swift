//
//  HomeViewModel.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 19/05/24.
//

import Foundation

protocol HomeViewModelDelegate {
    func updateCoffeeList()
    func handleLoadingState()
    func populateCoffessType()
}


class HomeViewModel : CoffeeListViewModelDelegate {

    
    var loadingImageIsHidden = false
    
    func updateCoffeeList() {
        loadingImageIsHidden = true
        delegate.updateCoffeeList()
        delegate.handleLoadingState()
    }
            
    var coffeeListViewModel: CoffeeListViewModel
    var delegate : HomeViewModelDelegate!
    
    //TODO: make this with dependency injection
    init(coffeRepository: CoffeeRepository) {
        self.coffeeListViewModel = CoffeeListViewModel(coffeeRepository: coffeRepository)
        coffeeListViewModel.delegate = self
    }
        
    func loadCoffeeListData() async {
       await coffeeListViewModel.loadData()
    }

    func populateCoffessType() {
        delegate.populateCoffessType()
    }
    
    
}
