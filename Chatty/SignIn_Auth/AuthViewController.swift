//
//  AuthVCProvider.swift
//  Chatty
//
//  Created by Oleg Krikun on 24.03.2021.
//

import SwiftUI

class AuthViewController: UIViewController {
 
    private let logoLabel = UILabel(text: "Chatty",
                                    font: .avenir32(),
                                    textColor: .black)
    
    private let googleLabel = UILabel(text: "Get started with")
    private let emailLabel = UILabel(text: "Or sign up with")
    private let loginLabel = UILabel(text: "Already onboard?")
    
    private let googleButton = UIButton(title: "Google",
                                    titleColor: .black,
                                    backgroundColor: .white,
                                    isShadow: true)
    private let emailButton = UIButton(title: "E-mail",
                                    titleColor: .white,
                                    backgroundColor: .buttonBlack(),
                                    isShadow: false)
    private let loginButton = UIButton(title: "Login",
                                    titleColor: .buttonRed(),
                                    backgroundColor: .white,
                                    isShadow: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstrains()
        view.backgroundColor = .white
    }
}

// MARK: Setup constrains
extension AuthViewController {
    private func setupConstrains() {
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let googleView = ButtonFormView(label: googleLabel,
                                         button: googleButton)
        let emailView = ButtonFormView(label: emailLabel,
                                        button: emailButton)
        let loginView = ButtonFormView(label: loginLabel,
                                        button: loginButton)
        
        let stackView = UIStackView(arrangedSubviews: [
                                        googleView,
                                        emailView,
                                        loginView],
                                    axis: .vertical,
                                    spacing: 32)
        stackView.translatesAutoresizingMaskIntoConstraints = false
  
        view.addSubview(logoLabel)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            logoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoLabel.bottomAnchor,
                                           constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: -40)
        ])
    }
}

//MARK: - SwiftUI for Canvas
struct AuthVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let authViewContoller = AuthViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return authViewContoller
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
