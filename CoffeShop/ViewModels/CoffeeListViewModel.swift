//
//  CoffeeListViewModel.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 30/05/24.
//

import Foundation

protocol CoffeeListViewModelDelegate {
    func updateCoffeeList()
    func populateCoffessType()
}

class CoffeeListViewModel {
    
    private let coffeeRepository: CoffeeRepository
    var coffeesViewModel: [CoffeeViewModel]
    private var _coffeesViewModel : [CoffeeViewModel]
    
    private var grindFilter = ""
    private var nameFilter = ""
    
    
    var coffeesType: [String] = []
    
    var delegate : CoffeeListViewModelDelegate!
    
    init(coffeeRepository: CoffeeRepository) {
        self.coffeeRepository = coffeeRepository
        self.coffeesViewModel = [CoffeeViewModel]()
        self._coffeesViewModel = self.coffeesViewModel
    }
    
    func loadData() async {
        await fetchCoffeeList()
    }

    private func fetchCoffeeList() async {
            do {
                let coffees = try await coffeeRepository.getCoffeeList()
                coffeesViewModel = coffees.map(CoffeeViewModel.init)
                getCoffessType()
                _coffeesViewModel = coffeesViewModel
                delegate.updateCoffeeList()
                delegate.populateCoffessType()
            } catch {
                print("Error fetch coffee list \(error.localizedDescription)")
            }
    }
    
    private func getCoffessType() {
        for vm in coffeesViewModel {
            let description = vm.grindOption.description
            if !coffeesType.contains(description.uppercased()) {
                coffeesType.append(description.uppercased())
              }
          }
    }
    
    func applyGrindFilter(grindFilter: String) {
        self.grindFilter = grindFilter
        handleFilters()
    }
    
    func applyNameFilter(name: String){
        self.nameFilter = name
        handleFilters()
    }
    
    private func handleFilters(){
        var filteredList: [CoffeeViewModel] = _coffeesViewModel

        switch (nameFilter.isEmpty, grindFilter.isEmpty) {
        case (false, true):
            filteredList = filteredList.filter { $0.name.contains(nameFilter) }
            
        case (true, false):
            filteredList = filteredList.filter { $0.grindOption.uppercased() == grindFilter.uppercased() }
            
        case (false, false):
            filteredList = filteredList.filter { $0.name.contains(nameFilter) }
            filteredList = filteredList.filter { $0.grindOption.uppercased() == grindFilter.uppercased() }

        case (true, true):
            break
        }
        
        coffeesViewModel = filteredList
        delegate.updateCoffeeList()
    }

}
