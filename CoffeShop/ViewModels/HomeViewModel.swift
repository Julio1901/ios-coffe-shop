//
//  HomeViewModel.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 19/05/24.
//

import Foundation

struct HomeViewModel {
    
    func getCoffeeList () async throws -> [Coffee] {
        let endpoint = "https://fake-coffee-api.vercel.app/api"
        
        guard let url = URL(string: endpoint) else {
            throw CoffeeApiError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw CoffeeApiError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Coffee].self, from: data)
        } catch {
            throw CoffeeApiError.decodingError
        }
            
    }
    
}


enum CoffeeApiError : Error {
    case invalidURL
    case invalidResponse
    case decodingError
}
