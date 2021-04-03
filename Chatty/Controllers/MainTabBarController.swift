//
//  MainTabBarController.swift
//  Chatty
//
//  Created by Oleg Krikun on 02.04.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = #colorLiteral(red: 0.5568627451, green: 0.3529411765, blue: 0.968627451, alpha: 1)
        let listVC = ConversationViewController()
        let peopleVC = PeopleViewController()
        
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        
        let conversationImage = UIImage(systemName: "bubble.left.and.bubble.right",
                                        withConfiguration: boldConfig)
        let peopleImage = UIImage(systemName: "person.2",
                                  withConfiguration: boldConfig)
        
        
        viewControllers = [
            setupNavigationController(rootViewController: peopleVC, title: "People", image: peopleImage),
            setupNavigationController(rootViewController: listVC, title: "Conversation", image: conversationImage)
        ]
    }
    
    private func setupNavigationController(rootViewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
