//
//  LocationRepositoryImpl.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 08/06/24.
//

import Foundation

class LocationRepositoryImpl : LocationRepository {
    
    private let cities = [
        "Reykjavik, Iceland",
        "Cape Town, South Africa",
        "Vancouver, Canada",
        "Mexico City, Mexico",
        "Tokyo, Japan",
        "Cairo, Egypt",
        "Sydney, Australia",
        "São Paulo, Brazil",
        "Rome, Italy",
        "New York City, United States"
    ]
    
    func getLocations() async throws  -> [Location] {
        var locations :  [Location] = []
        
        cities.forEach { cityName in
            let location = Location(name: cityName)
            locations.append(location)
        }
        return locations
    }

}
