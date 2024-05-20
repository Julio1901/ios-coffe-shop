//
//  CoffeeRepositoryImpl.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 20/05/24.
//

import Foundation

class CoffeeRepositoryImpl : CoffeeRepository {
    
    private let endpoint = "https://fake-coffee-api.vercel.app/api"
       
       func getCoffeeList() async throws -> [Coffee] {
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
