//
//  CoffeeRepositoryImpl.swift
//  CoffeShop
//
//  Created by Julio Cesar Pereira on 20/05/24.
//

import Foundation

class CoffeeRepositoryImpl : CoffeeRepository {
    
    private let endpoint = "https://fake-coffee-api.vercel.app/api"
    private let imageEndPoint = "https://coffee.alexflipnote.dev/random"
    
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
                var coffees = try decoder.decode([Coffee].self, from: data)
                let imageData =  try await fetchImageData()
                coffees[1].imageData = imageData
                // Para cada café, obtenha uma imagem separada
//                for index in 0..<coffees.count {
//                    let imageData = try await fetchImageData()
//                    coffees[index].imageData = imageData
//                }
                
                return coffees
            } catch {
                throw CoffeeApiError.decodingError
            }
        }
    
    private func fetchImageData() async throws -> Data? {
        guard let imageUrl = URL(string: imageEndPoint) else {
            throw CoffeeApiError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: imageUrl)
        return data
    }
}
