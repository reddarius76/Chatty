//
//  SignUpViewController.swift
//  Chatty
//
//  Created by Oleg Krikun on 30.03.2021.
//

import SwiftUI

class SignUpViewController: UIViewController {
    
    private let welcomeLabel = UILabel(text: "Hello! Hallo! Nihao!", font: .avenir26())
    
    private let emailLabel = UILabel(text: "E-mail")
    private let passwordLabel = UILabel(text: "Password")
    private let alreadyOnboardLabel = UILabel(text: "Already onboard?")
    
    private let emailTextField = OneLineTextField(font: .avenir20())
    private let passwordTextField = OneLineTextField(font: .avenir20())
    
    private let signUpButton = UIButton(title: "Sign Up", titleColor: .white, backgroundColor: .buttonBlack(), isShadow: false, cornerRadius: 4)
    private let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstrains()
        view.backgroundColor = .white
    }
    
    private func setupUI() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.buttonRed(), for: .normal)
        loginButton.titleLabel?.font = .avenir20()
    }
}

// MARK: Setup constrains
extension SignUpViewController {
    private func setupConstrains() {
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField],
                                         axis: .vertical,
                                         spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField],
                                         axis: .vertical,
                                         spacing: 0)
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let mainStackView = UIStackView(arrangedSubviews: [emailStackView, passwordStackView, signUpButton], axis: .vertical, spacing: 40)
        
        let bottomStackView = UIStackView(arrangedSubviews: [alreadyOnboardLabel, loginButton], axis: .horizontal, spacing: -1)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(mainStackView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor,
                                              constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: welcomeLabel.topAnchor,
                                               constant: 160),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                   constant: 40),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                    constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor,
                                                    constant: 60),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                     constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                      constant: -40)
        ])
        
    }
}



//MARK: - SwiftUI for Canvas
struct SignUpVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let signUpViewContoller = SignUpViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return signUpViewContoller
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
