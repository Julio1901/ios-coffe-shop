//
//  CoffeeRepositoryMock.swift
//  CoffeShopTests
//
//  Created by Julio Cesar Pereira on 08/06/24.
//

import Foundation
@testable import CoffeShop
import UIKit

class CoffeeRepositoryMock: CoffeeRepository {
    
    var imageDataToReturn: Data?
    var errorToThrow: Error?
    
    func getCoffeeList() async throws -> [CoffeShop.Coffee] {
        let coffees: [Coffee] = [
            Coffee(
                id: 1,
                name: "Espresso Roast",
                description: "A rich and bold espresso blend.",
                price: 9.99,
                grindOption: ["Espresso", "Whole Bean", "French press", "Filter"],
                imageData: nil
            ),
            Coffee(
                id: 2,
                name: "Morning Blend",
                description: "A smooth and balanced morning coffee.",
                price: 7.99,
                grindOption: ["Filter", "French press", "Whole bean"],
                imageData: nil
            ),
            Coffee(
                id: 3,
                name: "House Blend",
                description: "Our signature blend with a rich aroma.",
                price: 8.99,
                grindOption: ["Whole Bean", "Cafetiere", "French press", "Filter"],
                imageData: nil
            ),
            Coffee(
                id: 4,
                name: "Decaf Delight",
                description: "A decaffeinated coffee with full flavor.",
                price: 10.49,
                grindOption: ["Espresso", "Filter", "Whole bean"],
                imageData: nil
            ),
            Coffee(
                id: 5,
                name: "French Roast",
                description: "A dark roast with a smoky flavor.",
                price: 11.99,
                grindOption: ["French press", "Whole Bean"],
                imageData: nil
            )
        ]
        
        return coffees
    }
    
    func fetchImageData(urlString: String) async throws -> Data? {
        if let error = errorToThrow {
                   throw error
               }
        return imageDataToReturn
    }
    
    func loadImageDataFromProject(named imageName: String) {
        if let image = UIImage(named: imageName),
           let data = image.pngData() {
            self.imageDataToReturn = data
        }
    }
    
}

class CoffeeTypeTestRepositoryMock : CoffeeRepositoryMock {
    
    override func getCoffeeList() async throws -> [CoffeShop.Coffee] {
        let coffees: [Coffee] = [
            Coffee(
                id: 1,
                name: "Espresso Roast",
                description: "A rich and bold espresso blend.",
                price: 9.99,
                grindOption: ["Espresso", "Espresso", "Espresso", "Espresso"],
                imageData: nil
            ),
            Coffee(
                id: 2,
                name: "Morning Blend",
                description: "A smooth and balanced morning coffee.",
                price: 7.99,
                grindOption: ["Filter", "Filter", "Filter"],
                imageData: nil
            ),
            Coffee(
                id: 3,
                name: "House Blend",
                description: "Our signature blend with a rich aroma.",
                price: 8.99,
                grindOption: ["Whole Bean", "Whole Bean", "Whole Bean", "Whole Bean"],
                imageData: nil
            ),
            Coffee(
                id: 4,
                name: "Decaf Delight",
                description: "A decaffeinated coffee with full flavor.",
                price: 10.49,
                grindOption: ["French press", "French press", "French press"],
                imageData: nil
            ),
            Coffee(
                id: 5,
                name: "French Roast",
                description: "A dark roast with a smoky flavor.",
                price: 11.99,
                grindOption: ["French press", "French press"],
                imageData: nil
            )
        ]
        
        return coffees
    }
    
}


class CoffeeFilterRepositoryMock : CoffeeRepositoryMock {
    
    override func getCoffeeList() async throws -> [Coffee] {
        let coffees: [Coffee] = [
            Coffee(
                id: 1,
                name: "Espresso Roast",
                description: "A rich and bold espresso blend.",
                price: 9.99,
                grindOption: ["Espresso", "Espresso", "Espresso", "Espresso"],
                imageData: nil
            ),
            Coffee(
                id: 2,
                name: "Morning Blend",
                description: "A smooth and balanced morning coffee.",
                price: 7.99,
                grindOption: ["Filter", "Filter", "Filter"],
                imageData: nil
            ),
            Coffee(
                id: 3,
                name: "House Blend",
                description: "Our signature blend with a rich aroma.",
                price: 8.99,
                grindOption: ["Whole Bean", "Whole Bean", "Whole Bean", "Whole Bean"],
                imageData: nil
            ),
            Coffee(
                id: 4,
                name: "Decaf Delight",
                description: "A decaffeinated coffee with full flavor.",
                price: 10.49,
                grindOption: ["French press", "French press", "French press"],
                imageData: nil
            ),
            Coffee(
                id: 5,
                name: "French Roast",
                description: "A dark roast with a smoky flavor.",
                price: 11.99,
                grindOption: ["French press", "French press"],
                imageData: nil
            ),
            Coffee(
                id: 6,
                name: "Caramel Latte",
                description: "A sweet and creamy caramel latte.",
                price: 12.49,
                grindOption: ["Espresso", "Espresso"],
                imageData: nil
            ),
            Coffee(
                id: 7,
                name: "Vanilla Bean",
                description: "A smooth blend with a hint of vanilla.",
                price: 8.49,
                grindOption: ["Whole Bean", "Whole Bean", "Whole Bean"],
                imageData: nil
            ),
            Coffee(
                id: 8,
                name: "Hazelnut Harmony",
                description: "A nutty blend with rich hazelnut flavor.",
                price: 9.79,
                grindOption: ["Filter", "Filter"],
                imageData: nil
            ),
            Coffee(
                id: 9,
                name: "Mocha Madness",
                description: "A chocolate-infused coffee blend.",
                price: 10.99,
                grindOption: ["Espresso", "Espresso", "Espresso"],
                imageData: nil
            ),
            Coffee(
                id: 10,
                name: "Pumpkin Spice",
                description: "A seasonal blend with pumpkin spice.",
                price: 11.29,
                grindOption: ["Filter", "Filter", "Filter"],
                imageData: nil
            )
        ]
        
        return coffees
    }
    
}
