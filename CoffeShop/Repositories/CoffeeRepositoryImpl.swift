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
                var coffees = try decoder.decode([Coffee].self, from: data)
                for index in 0..<coffees.count {
                    let coffeeImage = try await getImageUrl()
                    coffees[index].imageData = try await fetchImageData(urlString: coffeeImage.file)
            }
                return coffees
            } catch {
                throw CoffeeApiError.decodingError
            }
        }
    
   private func getImageUrl() async throws -> CoffeeImageUrl {
        let imageEndPoint = "https://coffee.alexflipnote.dev/random.json"
        
        guard let url = URL(string: imageEndPoint) else {
            throw CoffeeApiError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw CoffeeApiError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(CoffeeImageUrl.self, from: data)
            
        }catch {
            throw CoffeeApiError.decodingError
        }
    }
    
    
    internal func fetchImageData(urlString: String) async throws -> Data? {
            guard let url = URL(string: urlString) else { return nil }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                return data
            } catch {
                print("Erro ao baixar a imagem: \(error)")
                return nil
            }
    }
    
    

    
}
