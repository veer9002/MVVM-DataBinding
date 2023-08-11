//
//  ProductViewController.swift
//  MVVM-DataBinding
//
//  Created by Manish  Sharma on 11/08/23.
//

import UIKit

class ProductViewController: UIViewController {

    private var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
}

extension ProductViewController {
    func configuration() {
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        viewModel.fetchProducts()
    }
    
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            
            switch event {
            case .loading: break
            case .stopLoading: break
            case .dataLoaded:
                print(self.viewModel.products)
            case .error(let error):
                print(error)
                
            }
        }
    }
}
