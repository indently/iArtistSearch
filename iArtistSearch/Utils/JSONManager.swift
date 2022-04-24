//
//  JSONManager.swift
//  iArtistSearch
//
//  Created by Federico on 24/04/2022.
//

import Foundation

enum APIError: Error {
    case invalidRequest
    case invalidURL
}

//MARK: - Generic function to create api requests asynchronously
func fetchSearch<T: Decodable>(url: String, model: T.Type) async throws -> T {
    guard let url = URL(string: url) else { throw APIError.invalidURL }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse,
          response.statusCode == 200 else {
        throw APIError.invalidRequest
    }
    
    let decodedData = try JSONDecoder().decode(T.self, from: data)
    return decodedData
}

extension Bundle {
    //MARK: - Used to decode local JSON files
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
}
