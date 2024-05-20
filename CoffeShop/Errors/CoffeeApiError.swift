//
//  CoffeeApiError.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 20/05/24.
//

import Foundation

enum CoffeeApiError : Error {
    case invalidURL
    case invalidResponse
    case decodingError
}
