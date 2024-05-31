//
//  Coffee.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 19/05/24.
//

import Foundation

struct Coffee: Codable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let grindOption: [String]
    var imageData: Data?

    enum CodingKeys: String, CodingKey {
        case id, name, description, price, imageData
        case grindOption = "grind_option"
    }
}
