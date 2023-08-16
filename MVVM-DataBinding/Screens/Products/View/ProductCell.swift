//
//  ProductCell.swift
//  MVVM-DataBinding
//
//  Created by Manish  Sharma on 16/08/23.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnRate: UIButton!
    @IBOutlet weak var btnBuy: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var bgView: UIView!
    
    var product : Product? {
        didSet {
            productDetailConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.clipsToBounds = false
        bgView.layer.cornerRadius  = 15
        bgView.backgroundColor = .systemGray6
        imgView.layer.cornerRadius = 10
    }
    
    func productDetailConfiguration() {
        guard let product else { return }
        lblTitle.text = product.title
        lblCategory.text = product.category
        lblDescription.text = product.description
        lblPrice.text = "$\(product.price)"
        btnRate.setTitle("\(product.rating.rate)", for: .normal)
        imgView.setImage(with: product.image)
    }
}
