//
//  LoginViewController.swift
//  Chatty
//
//  Created by Oleg Krikun on 30.03.2021.
//

import SwiftUI

class LoginViewController: UIViewController {
    
    private let welcomeLabel = UILabel(text: "Welcome back!", font: .avenir26())
    
    private let loginWithLabel = UILabel(text: "Login with")
    private let googleButton = UIButton(title: "Google",
                                    titleColor: .black,
                                    backgroundColor: .white,
                                    isShadow: true)
    
    private let orLabel = UILabel(text: "or")
    
    private let emailLabel = UILabel(text: "E-mail")
    private let emailTextField = OneLineTextField(font: .avenir20())
    
    private let passwordLabel = UILabel(text: "Password")
    private let passwordTextField = OneLineTextField(font: .avenir20())
    
    private let loginButton = UIButton(title: "Login",
                                    titleColor: .white,
                                    backgroundColor: .buttonBlack(),
                                    isShadow: false)
    
    private let needAnAccountLabel = UILabel(text: "Need an account?")
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.buttonRed(), for: .normal)
        button.titleLabel?.font = .avenir20()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstrains()
        view.backgroundColor = .white
    }
}

// MARK: Setup constrains
extension LoginViewController {
    private func setupConstrains() {
        let loginWithView = ButtonFormView(label: loginWithLabel,
                                           button: googleButton)
        let emailStackView = UIStackView(arrangedSubviews: [
                                            emailLabel,
                                            emailTextField],
                                         axis: .vertical,
                                         spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [
                                                passwordLabel,
                                                passwordTextField],
                                            axis: .vertical,
                                            spacing: 0)
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let mainStackView = UIStackView(arrangedSubviews: [
                                            loginWithView,
                                            emailStackView,
                                            orLabel,
                                            passwordStackView,
                                            loginButton],
                                        axis: .vertical,
                                        spacing: 40)
        
        signUpButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubviews: [
                                            needAnAccountLabel,
                                            signUpButton],
                                          axis: .horizontal,
                                          spacing: 10)
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(mainStackView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: welcomeLabel.topAnchor,
                                               constant: 120),
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
struct LoginVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let loginViewContoller = LoginViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return loginViewContoller
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
