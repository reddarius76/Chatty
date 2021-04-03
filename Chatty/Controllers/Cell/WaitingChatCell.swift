//
//  WaitingChatCell.swift
//  Chatty
//
//  Created by Oleg Krikun on 03.04.2021.
//

import SwiftUI

class WaitingChatCell: UICollectionViewCell, ConfiguringCell {
    static var reuseId = "WaitingChatCell"
    
    let friendImageView = UIImageView()
    
    func configure(with value: MChat) {
        friendImageView.image = UIImage(systemName: value.userImageString)?.withTintColor(UIColor.systemBlue, renderingMode: .alwaysOriginal)
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
            friendImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            friendImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            friendImageView.heightAnchor.constraint(equalToConstant: 78),
            friendImageView.widthAnchor.constraint(equalToConstant: 78)
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
