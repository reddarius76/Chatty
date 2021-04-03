//
//  ActiveChatCell.swift
//  Chatty
//
//  Created by Oleg Krikun on 02.04.2021.
//

import SwiftUI

class ActiveChatCell: UICollectionViewCell, ConfiguringCell  {
    static var reuseId = "ActiveChatCell"
    
    private let friendImageView = UIImageView()
    private let friendName = UILabel(text: "UserName",
                                     font: .laoSangamMN20())
    private let lastMessage = UILabel(text: "Nihao!",
                                      font: .laoSangamMN18())
    private let gradientView = GradientView(from: .topTrailing,
                                            to: .bottomLeading,
                                            startColor: #colorLiteral(red: 0.7882352941, green: 0.631372549, blue: 0.9411764706, alpha: 1),
                                            endColor: #colorLiteral(red: 0.4784313725, green: 0.6980392157, blue: 0.9215686275, alpha: 1))
    
    func configure<U>(with value: U) where U : Hashable {
        guard let value = value as? MChat else {
            fatalError("Unknown U.Type for configure ActiveChatCell")
        }
        friendImageView.image = UIImage(systemName: value.userImageString)?.withTintColor(UIColor.systemGreen, renderingMode: .alwaysOriginal)
        friendImageView.contentMode = .scaleAspectFit
        friendName.text = value.userName
        lastMessage.text = value.lastMessage
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
extension ActiveChatCell {
    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        friendName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        gradientView.backgroundColor = .systemPink
        
        addSubview(friendImageView)
        addSubview(friendName)
        addSubview(lastMessage)
        addSubview(gradientView)
        
        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            friendImageView.heightAnchor.constraint(equalToConstant: 78),
            friendImageView.widthAnchor.constraint(equalToConstant: 78)
        ])
        
        NSLayoutConstraint.activate([
            friendName.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            friendName.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 8),
            friendName.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            lastMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            lastMessage.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 8),
            lastMessage.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gradientView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 78),
            gradientView.widthAnchor.constraint(equalToConstant: 8)
        ])
    }
}

//MARK: - SwiftUI for Canvas
struct ActiveChatProvider: PreviewProvider {
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


