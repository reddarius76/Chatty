//
//  UIViewController + Extension.swift
//  Chatty
//
//  Created by Oleg Krikun on 03.04.2021.
//

import UIKit

extension UIViewController {
    func configure<T: ConfiguringCell, U: Hashable>(collectionView: UICollectionView,
                                                    cellType: T.Type,
                                                    with value: U,
                                                    for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")
        }
        cell.configure(with: value)
        return cell
    }
}
