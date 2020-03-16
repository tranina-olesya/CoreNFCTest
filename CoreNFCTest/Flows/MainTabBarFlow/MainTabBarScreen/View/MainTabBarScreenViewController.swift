//
//  MainTabBarScreenViewController.swift
//  CoreNFCTest
//
//  Created by Olesya Tranina on 18/01/2020.
//  Copyright © 2020 Олеся Транина. All rights reserved.
//

import UIKit

final class MainTabBarScreenViewController: UITabBarController, ModuleTransitionable {

    // MARK: - Properties

    var output: MainTabBarScreenViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
    }

}

// MARK: - MainTabBarScreenViewInput

extension MainTabBarScreenViewController: MainTabBarScreenViewInput {

    func setupInitialState() {
        setupTabBar()
    }

}

// MARK: - Configuration

extension MainTabBarScreenViewController {

    func setupTabBar() {
        var controllers: [UIViewController] = []
        for tab in MainScreenTab.allCases {
            let vc = tab.viewController

            let tabBarItem = UITabBarItem(title: tab.title,
                                          image: tab.image,
                                          selectedImage: tab.image)
            vc.tabBarItem = tabBarItem
            controllers.append(vc)
        }

        viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
    }

}
