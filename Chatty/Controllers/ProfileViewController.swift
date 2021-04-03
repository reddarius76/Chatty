//
//  ProfileViewController.swift
//  Chatty
//
//  Created by Oleg Krikun on 03.04.2021.
//

import SwiftUI

class ProfileViewController: UIViewController {
    
    private let containerView = UIView()
    private let imageView = UIImageView(image: #imageLiteral(resourceName: "human10"), contentMode: .scaleAspectFill)
    private let nameLabel = UILabel(text: "LaLa",
                                    font: .systemFont(ofSize: 22, weight: .light))
    private let aboutMeLabel = UILabel(text: "Hello! Go to!",
                                       font: .systemFont(ofSize: 18, weight: .light))
    private let messageTextField = InsertableTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        customizeElements()
        setupConstraints()
    }
    
    private func customizeElements() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        messageTextField .translatesAutoresizingMaskIntoConstraints = false
        
        aboutMeLabel.numberOfLines = 0
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 32
        
        if let button = messageTextField.rightView as? UIButton {
            button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        }
    }
    
    @objc private func sendMessage() {
        print(#function)
    }
}

// MARK: - Setup constrains
extension ProfileViewController {
    private func setupConstraints() {
        
        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        containerView.addSubview(messageTextField)
        
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
            messageTextField.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor,
                                                  constant: 8),
            messageTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                      constant: 24),
            messageTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,
                                                       constant: -24),
            messageTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

//MARK: - SwiftUI for Canvas
struct ProfileVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let profileViewContoller = ProfileViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return profileViewContoller
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
