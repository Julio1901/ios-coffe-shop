//
//  HomeViewController.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 24/05/24.
//

import UIKit

class HomeViewController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    
    private var initialScreen = HomeScreen()
    private var dataList = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialScreen.coffeeList.dataSource = self
        initialScreen.coffeeList.delegate = self
        initialScreen.coffeeList.register(CoffeeWithPriceCell.self, forCellWithReuseIdentifier: "CoffeeWithPriceCell")
        view = initialScreen
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoffeeWithPriceCell", for: indexPath) as! CoffeeWithPriceCell
//        cell.coffeName.text = dataList[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width/2 - 15, height: 156)
        return CGSize(width: 156, height: 238)
    }
    
}

