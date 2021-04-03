//
//  ChatRequestViewController.swift
//  Chatty
//
//  Created by Oleg Krikun on 03.04.2021.
//

import SwiftUI

class ChatRequestViewController: UIViewController {
    
    private let containerView = UIView()
    private let imageView = UIImageView(image: #imageLiteral(resourceName: "human10"), contentMode: .scaleAspectFill)
    private let nameLabel = UILabel(text: "LaLa",
                                    font: .systemFont(ofSize: 22, weight: .light))
    private let aboutMeLabel = UILabel(text: "Hello! Chats me!",
                                       font: .systemFont(ofSize: 18, weight: .light))
    private let acceptButton = UIButton(title: "Accept",
                                        titleColor: .white,
                                        backgroundColor: .black,
                                        font: .laoSangamMN20(),
                                        isShadow: false,
                                        cornerRadius: 10)
    private let denyButton = UIButton(title: "Deny",
                                        titleColor: #colorLiteral(red: 0.8352941176, green: 0.2, blue: 0.2, alpha: 1),
                                        backgroundColor: .mainWhite(),
                                        font: .laoSangamMN20(),
                                        isShadow: false,
                                        cornerRadius: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeElements()
        setupConstraints()
        view.backgroundColor = .systemRed
    }
    
    private func customizeElements() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        aboutMeLabel.numberOfLines = 0
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 32
        denyButton.layer.borderWidth = 1.2
        denyButton.layer.borderColor = #colorLiteral(red: 0.8352941176, green: 0.2, blue: 0.2, alpha: 1)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        acceptButton.applyGradient(cornerRadius: 10)
    }
}

// MARK: - Setup constrains
extension ChatRequestViewController {
    private func setupConstraints() {
        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        
        let buttonsStackView = UIStackView(arrangedSubviews: [acceptButton, denyButton], axis: .horizontal, spacing: 8)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.distribution = .fillEqually
        containerView.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 32)
        ])
        
        NSLayoutConstraint.activate([
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 206)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor,
                                           constant: 32),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                               constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,
                                              constant: 8),
            aboutMeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                  constant: 24),
            aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                   constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor,
                                                  constant: 16),
            buttonsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                      constant: 24),
            buttonsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                       constant: -24),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}

//MARK: - SwiftUI for Canvas
struct CharRequestVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let chatRequestViewContoller = ChatRequestViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return chatRequestViewContoller
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
