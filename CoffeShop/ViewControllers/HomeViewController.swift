//
//  HomeViewController.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 24/05/24.
//

import UIKit

class HomeViewController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, HomeViewModelDelegate  {
    
    
    func updateCoffeeList() {
        DispatchQueue.main.async {
              self.initialScreen.coffeeList.reloadData()
          }
    }
    

    
    private var initialScreen = HomeScreen()
    private var dataList = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5",
                            "Item 6","Item 7","Item 8","Item 9","Item 10","Item 11",
                            "Item 12","Item 13","Item 14","Item 15","Item 16","Item 17"]
    
    
    private var homeViewModel : HomeViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialScreen.coffeeList.dataSource = self
        initialScreen.coffeeList.delegate = self
        initialScreen.coffeeList.register(CoffeeWithPriceCell.self, forCellWithReuseIdentifier: "CoffeeWithPriceCell")
        let coffeeRepository = CoffeeRepositoryImpl()
        homeViewModel = HomeViewModel(coffeRepository: coffeeRepository)
        homeViewModel.delegate = self
        view = initialScreen
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeViewModel.coffeeListViewModel.coffeesViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoffeeWithPriceCell", for: indexPath) as! CoffeeWithPriceCell
//        cell.coffeName.text = dataList[indexPath.row]
        
        
        let vm = self.homeViewModel.coffeeListViewModel.coffeesViewModel[indexPath.row]
        
        cell.rating = vm.rating
        cell.title = vm.name
        cell.coffeeType = vm.grindOption
        cell.price = vm.price
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 238)
    }
    
}

