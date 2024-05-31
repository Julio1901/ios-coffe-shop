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
    
    var image: Data {
            if let imageData = self.coffee.imageData {
                return imageData
            } else {
                // Se coffee.imageData for nulo, carregue a imagem predefinida como Data
                if let defaultImagePath = Bundle.main.path(forResource: "coffe-product-image", ofType: "png") {
                    if let defaultImageData = try? Data(contentsOf: URL(fileURLWithPath: defaultImagePath)) {
                        return defaultImageData
                    } else {
                        print("Erro ao carregar a imagem padrão")
                    }
                } else {
                    print("Imagem padrão não encontrada")
                }
                // Se ocorrer algum erro, retorne Data vazia
                return Data()
            }
        }
    
}
