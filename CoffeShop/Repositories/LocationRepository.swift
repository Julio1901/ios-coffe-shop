//
//  LocationRepository.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 08/06/24.
//

import Foundation

protocol LocationRepository {
    func getLocations() async throws -> [Location]
}
