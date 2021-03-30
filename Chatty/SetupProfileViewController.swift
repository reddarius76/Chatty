//
//  SetupProfileViewController.swift
//  Chatty
//
//  Created by Oleg Krikun on 30.03.2021.
//

import SwiftUI

class SetupProfileViewController: UIViewController {
    
    private let welcomeLabel = UILabel(text: "Setup profile!", font: .avenir26())
    private let fullImageView = AddPhotoView()
    
    private let fullNameLabel = UILabel(text: "Full name")
    private let fullNameTextField = OneLineTextField(font: .avenir20())
    
    private let aboutMeLabel = UILabel(text: "About me")
    private let aboutMeTextField = OneLineTextField(font: .avenir20())
    
    private let genderLabel = UILabel(text: "Gender")
    private let genderSegmentedControl = UISegmentedControl(first: "Male", second: "Female")
    
    private let goToChatButton = UIButton(title: "Go to chats!",
                                    titleColor: .white,
                                    backgroundColor: .buttonBlack(),
                                    isShadow: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstrains()
        view.backgroundColor = .white
    }
}

// MARK: - Setup constrains
extension SetupProfileViewController {
    private func setupConstrains() {
        let fullNameStackView = UIStackView(arrangedSubviews: [
                                                fullNameLabel,
                                                fullNameTextField],
                                            axis: .vertical,
                                            spacing: 0)
        let aboutMeStackView = UIStackView(arrangedSubviews: [
                                            aboutMeLabel,
                                            aboutMeTextField],
                                           axis: .vertical,
                                           spacing: 0)
        let genderStackView = UIStackView(arrangedSubviews: [
                                            genderLabel,
                                            genderSegmentedControl],
                                          axis: .vertical,
                                          spacing: 8)
        
        goToChatButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let mainStackView = UIStackView(arrangedSubviews: [
                                            fullNameStackView,
                                            aboutMeStackView,
                                            genderStackView,
                                            goToChatButton],
                                        axis: .vertical,
                                        spacing: 40)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(fullImageView)
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            fullImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 32),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: fullImageView.bottomAnchor,
                                               constant: 32),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                   constant: 40),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                    constant: -40)
        ])
    }
}

//MARK: - SwiftUI for Canvas
struct SetupProfileVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let setupProfileViewContoller = SetupProfileViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return setupProfileViewContoller
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
