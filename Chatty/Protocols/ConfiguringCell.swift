//
//  ConfiguringCell.swift
//  Chatty
//
//  Created by Oleg Krikun on 03.04.2021.
//

protocol ConfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}
