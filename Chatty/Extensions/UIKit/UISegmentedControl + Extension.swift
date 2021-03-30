//
//  UISegmentedControl + Extension.swift
//  Chatty
//
//  Created by Oleg Krikun on 30.03.2021.
//

import UIKit

extension UISegmentedControl {
     
    convenience init(first: String, second: String) {
        self.init()
        
        self.insertSegment(withTitle: first, at: 0, animated: true)
        self.insertSegment(withTitle: second, at: 1, animated: true)
        self.selectedSegmentIndex = 0
        self.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.avenir16() ?? .systemFont(ofSize: 16)],
                                    for: .normal)
    }
}
