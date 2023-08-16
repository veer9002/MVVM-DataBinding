//
//  UIImageView+Extensions.swift
//  MVVM-DataBinding
//
//  Created by Manish  Sharma on 16/08/23.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with URLString: String) {
        guard let url = URL.init(string: URLString) else {
            return
        }
        let resource = KF.ImageResource(downloadURL: url, cacheKey: URLString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
