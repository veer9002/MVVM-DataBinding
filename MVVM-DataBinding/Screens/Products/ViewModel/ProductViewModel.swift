//
//  ProductViewModel.swift
//  MVVM-DataBinding
//
//  Created by Manish  Sharma on 11/08/23.
//

import Foundation

class ProductViewModel {
    var products = [Product]()
    var eventHandler: ((_ event: Event) -> Void)? // data binding using closure

    func fetchProducts() {
        self.eventHandler?(.loading)
        APIManager.shared.fetchProduct { response in
            self.eventHandler?(.stopLoading)

            switch response {
            case .success(let products):
                self.products = products
                self.eventHandler?(.dataLoaded)

            case .failure(let error):
                print(error)
                self.eventHandler?(.error(error))

            }
        }
    }
}

extension ProductViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
