//
//  CoffeeViewModel.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 30/05/24.
//

import Foundation
import UIKit

struct CoffeeViewModel {
    
    var coffee: Coffee
    let randomGrindIndex : Int
    
    init(coffee: Coffee) {
        self.coffee = coffee
        self.randomGrindIndex = Int.random(in: 0..<self.coffee.grindOption.count)
    }
    
    var id: Int {
        return self.coffee.id
    }
    
    var name: String {
        return self.coffee.name
    }
    
    var description: String {
        return self.coffee.description
    }
    
    var price: String {
        return String(format: "%.2f", self.coffee.price)
    }
    
    var grindOption: String {
        return coffee.grindOption[randomGrindIndex]
    }
    
    var rating: String {
        let randomDouble = Double.random(in: 2.0...5.0)
        let formattedString = String(format: "%.1f", randomDouble)
        return  formattedString
    }
  
    
    var image: Data? {
        return self.coffee.imageData
    }
    
}
