//
//  APIManager.swift
//  MVVM-DataBinding
//
//  Created by Manish  Sharma on 10/08/23.
//

import UIKit

enum DataError: Error {
    case network(Error?)
    case invalidResponse
    case invalidURL
    case invalidData
}

typealias Handler = (Result<[Product], DataError>) -> Void

// Singleton
final class APIManager {
    static let shared = APIManager()
    private init() { }
    
    func fetchProduct(completion: @escaping Handler) {
        guard let url = URL(string: Constant.API.productUrl) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.network(error)))
            }
        }.resume()
    }
}
