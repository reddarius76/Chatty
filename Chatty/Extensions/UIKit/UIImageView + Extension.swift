//
//  UIImageView + Extension.swift
//  Chatty
//
//  Created by Oleg Krikun on 03.04.2021.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
}

extension UIImageView {
    func setupColor(color: UIColor) {
        let tempImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = tempImage
        self.tintColor = color
    }
}
