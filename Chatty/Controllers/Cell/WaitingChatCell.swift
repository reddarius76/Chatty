//
//  WaitingChatCell.swift
//  Chatty
//
//  Created by Oleg Krikun on 03.04.2021.
//

import SwiftUI

class WaitingChatCell: UICollectionViewCell, ConfiguringCell {
    static var reuseId = "WaitingChatCell"
    
    private let friendImageView = UIImageView()
    
    func configure<U>(with value: U) where U : Hashable {
        guard let value = value as? MChat else {
            fatalError("Unknown U.Type for configure WaitingChatCell")
        }
        friendImageView.image = UIImage(named: value.userImageString)
        friendImageView.contentMode = .scaleAspectFit
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupConstraints()
        
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup constrains
extension WaitingChatCell {
    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(friendImageView)
        
        NSLayoutConstraint.activate([
            friendImageView.topAnchor.constraint(equalTo: self.topAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

//MARK: - SwiftUI for Canvas
struct WaitingChatProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
