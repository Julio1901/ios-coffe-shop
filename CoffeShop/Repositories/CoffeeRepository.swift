//
//  CoffeeRepository.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 20/05/24.
//

import Foundation

protocol CoffeeRepository {
    func getCoffeeList() async throws -> [Coffee]
}
