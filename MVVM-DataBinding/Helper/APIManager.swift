//
//  APIManager.swift
//  MVVM-DataBinding
//
//  Created by Manish  Sharma on 10/08/23.
//

import UIKit

// Singleton
final class APIManager {
    static let shared = APIManager()
    private init() { }
    
    func fetchProduct() {
        guard let url = URL(string: Constant.API.productUrl) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                return
            }
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                return
            }
            
            
            
        }.resume()
    }
    
    
}
