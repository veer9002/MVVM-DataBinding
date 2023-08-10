//
//  Product.swift
//  MVVM-DataBinding
//
//  Created by Manish  Sharma on 10/08/23.
//

import Foundation

struct Product {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating {
    let rate: Float
    let count: Int
}
