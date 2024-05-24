//
//  HomeViewController.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 24/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var initialScreen = HomeScreen()
    private var dataList = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = initialScreen
        initialScreen.configureCoffeeList(delegate: self, dataSource: self)
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CoffeeWithPriceCell.reuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = dataList[indexPath.row]
        return cell
    }
}
