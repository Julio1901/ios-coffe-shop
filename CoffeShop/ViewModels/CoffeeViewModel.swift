//
//  CoffeeViewModel.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 30/05/24.
//

import Foundation
import UIKit

struct CoffeeViewModel {
    
    let coffee: Coffee
    
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
        let randomIndex =  Int.random(in: 0...(coffee.grindOption.count - 1))
        return coffee.grindOption[randomIndex]
    }
    
    var rating: String {
        let randomDouble = Double.random(in: 2.0...5.0)
        let formattedString = String(format: "%.1f", randomDouble)
        return  formattedString
    }
    
    var image: CoffeeImage? {
        return self.coffee.coffeeImage
    }
    
}
