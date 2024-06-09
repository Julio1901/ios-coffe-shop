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
    var locationRepository : LocationRepository!
    
    var locationList : [Location] = []
    
    func updateCoffeeList() {
        loadingImageIsHidden = true
        delegate.updateCoffeeList()
        delegate.handleLoadingState()
    }
            
    var coffeeListViewModel: CoffeeListViewModel
    var delegate : HomeViewModelDelegate!
    
    //TODO: make this with dependency injection
    init(coffeRepository: CoffeeRepository, locationRepository: LocationRepository) {
        self.coffeeListViewModel = CoffeeListViewModel(coffeeRepository: coffeRepository)
        self.locationRepository = locationRepository
        coffeeListViewModel.delegate = self
        
    }
        
    func loadCoffeeListData() async {
       await coffeeListViewModel.loadData()
    }

    func populateCoffessType() {
        delegate.populateCoffessType()
    }
    
    func loadLocationsData() async {
        do{
            locationList = try await locationRepository.getLocations()
        }
        catch {
           print("Error fetch location list \(error.localizedDescription)")
       }
       
    }
    
    
}
